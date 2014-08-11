---
title: "Irc2Wiki"
lastmodified: '2008-07-02'
redirect_from:
  - /Irc2Wiki/
---

Irc2Wiki
========

A mutiliated version of Jamie Zawinksi's irc2html.pl that creates basic MediaWiki tables instead of HTML. Used by the [Accessibility Team](/Accessibility:_Team "Accessibility: Team") to post IRC meeting logs. Works great with irssi log format; can't speak for anything else.

``` perl
#!/usr/bin/perl -w
# irc2wiki.pl --- Hacked up irc2html.pl that spits plain MediaWiki tables
#                 Sandy Armstrong <sanfordarmstrong@gmail.com>
# irc2html.pl --- converts raw chat logs to a readable HTML table-ized form.
# Copyright © 1998-2006 Jamie Zawinski <jwz@jwz.org>
#
# Permission to use, copy, modify, distribute, and sell this software and its
# documentation for any purpose is hereby granted without fee, provided that
# the above copyright notice appear in all copies and that both that
# copyright notice and this permission notice appear in supporting
# documentation.  No representations are made about the suitability of this
# software for any purpose.  It is provided "as is" without express or 
# implied warranty.
#
# Created: 11-Jun-98.
#
# usage: irc2html.pl [--verbose] [--strip] [--no-color] infile outfile
# Or, just install it as a CGI on your web server.
#
# The format it expects from the logs is the format written by, e.g., tkirc:
# each line has a \t on it, and the part before the tab is the person talking,
# or the action happening ("[ join ]" and so on) and the part after the tab
# is the actual text.
#
# A number of other formats are accepted as well, e.g.,
#
#      [17:01:17] <user> blah blah
# and
#      13:25 [xxx(~xxx@00.11.222.333)] blah blah
#      13:25 [msg(xxx)] blah blah
#
# If the line doesn't match any of the known patterns, then we assume that
# the stuff before the first space is the action and the rest is the text.
#
# The lines alternate white and gray, changing each time the person talking
# changes (so multiple lines by the same person are colored the same.)
# Or, if --no-color is specified, the talkers are separated by solid
# horizontal lines.
#
# If a line ends in something that looks like a timestamp, that goes in
# column 3.
#
# The --strip option means to strip out non-talking lines, like "[ join ]".
#
# URLs are made clickable.
#
# Color codes, bold, etc. are also supported, thanks to
# Andy Brezinsky <andy@mbrez.com> and Juerd <juerd@juerd.nl>.
#
#
# This script also works as a CGI: just make a symlink (e.g., irc2html.cgi)
# and it will present you with a text area where you can paste your char log.
# When you submit, it will return the HTML document.  This might save some
# time messing around with temporary files.
#
# 5-May-2006: jwz: updated to use CSS instead of <FONT> tags.
 
require 5;
use diagnostics;
use strict;
 
my $progname = $0; $progname =~ s@^.*/([^/]+)$@$1@;
my $version = q{ $Revision: 1.23 $ }; $version =~ s/^[^0-9]+([0-9.]+).*$/$1/;
 
my $verbose = 0;
 
my $strip_seconds = 1;     # whether to keep timestamps in hh:mm only.
my $strip_timestamps = 0;  # whether to omit any third column entirely.
my $strip_noise = 0;       # whether to strip "join", "leave", etc.
my $colorize_p = 1;        # whether to do background colors.
my $separators_p = 0;      # whether to do horizontal lines.
my $chunk_size = 200;      # start a new table after this many lines.
 
my $url_re = q{\b(s?https?|ftp|file|gopher|s?news|telnet|mailbox):} .
             q{(//[-A-Z0-9_.]+:\d*)?} .
             q{[-A-Z0-9_=?\#\$\@~\`%&*+|\/.,;\240]+};
 
my $fg_color  = "#000";
my $bg_color1 = "#FFF";
my $bg_color2 = "#EEE";
 
 
$ENV{USER} = ($ENV{REMOTE_ADDR} || '?') unless defined ($ENV{USER});
 
my $doc_head = 
 (
  ""
 );
 
my $stylesheet = 
 ("<!--   This style sheet can be omitted if you don't care\n" .
  "       about the colored text that was used below.   -->\n" .
  "<STYLE TYPE=\"text/css\">\n" .
  " <!--\n" .
  "  .fc0  { color:white   } .bc0  { background:white   }\n" .
  "  .fc1  { color:black   } .bc1  { background:black   }\n" .
  "  .fc2  { color:navy    } .bc2  { background:navy    }\n" .
  "  .fc3  { color:green   } .bc3  { background:green   }\n" .
  "  .fc4  { color:red     } .bc4  { background:red     }\n" .
  "  .fc5  { color:darkred } .bc5  { background:darkred }\n" .
  "  .fc6  { color:purple  } .bc6  { background:purple  }\n" .
  "  .fc7  { color:orange  } .bc7  { background:orange  }\n" .
  "  .fc8  { color:yellow  } .bc8  { background:yellow  }\n" .
  "  .fc9  { color:lime    } .bc9  { background:lime    }\n" .
  "  .fc10 { color:aqua    } .bc10 { background:aqua    }\n" .
  "  .fc11 { color:C0C0FF  } .bc11 { background:C0C0FF  }\n" .
  "  .fc12 { color:blue    } .bc12 { background:blue    }\n" .
  "  .fc13 { color:magenta } .bc13 { background:magenta }\n" .
  "  .fc14 { color:gray    } .bc14 { background:gray    }\n" .
  "  .fc15 { color:silver  } .bc15 { background:silver  }\n" .
# "  .fixed {font-family: fixedsys, courier new, courier, fixed;\n" .
# "          font-size: xx-small; }\n" .
  "  -->\n" .
  "</STYLE>\n" .
  "\n");
 
my $margin_style = " STYLE=\"border-top: 1px solid;\""; # used for separators
 
 
my $input_lines = 0;
my $output_lines = 0;
 
 
sub convert_line_body($) {
  my ($line) = @_;
 
  # don't allow any single word to be longer than N chars -- insert spaces.
  # (actually, insert non-breaking spaces (240) which we convert later.)
  1 while ($line =~ s/^(.*?)([^ \t\n\240]{40})([^ \t\n\240].*)$/$1$2\240$3/s);
 
  $line =~ s/&/&amp;/g;
  $line =~ s/</&lt;/g;
  $line =~ s/>/&gt;/g;
#  $line =~ s/\"/&quot;/g;
 
  # make urls clickable.
  #$line =~ s@($url_re)@<A HREF="$1">$1</A>@gi;
 
  # if the url appeared to end in punctuation, back up over it.
  #$line =~ s@([-.,!;?\#]+)(\">)@$2@gs;
  #$line =~ s@([-.,!;?\#]+)(</A>)@$2$1@gs;
 
  # if we inserted any non-breaking spaces inside URLs, just nuke them.
  #1 while ($line =~ s@(<A HREF=\"[^\"\240]*)\240([^\"]*\">)@$1$2@gi);
 
  # convert remaining non-breaking spaces to real spaces.
  $line =~ s/\240/ /g;
 
  #if ($verbose) {
  #  $_ = $line;
  #  while (s@<A HREF=\"(.*?)\">@@i) {
  #    print STDERR "$progname: line $input_lines: URL: $1\n";
  #  }
  #}
 
  # if there are any ctl characters in it, do color-decoding
  $line = convert_color ($line)
    if ($line =~ m/[\000-\010\013\014\016-\037]/);
 
  return $line;
}
 
 
my $prev_head = "";
my $prev_stamp = "";
my $bg_color = $bg_color1;
my $line_tick = 0;
my $any_styles = 0;   # whether any red hot style sheet action is needed
 
sub convert_line($) {
  ($_) = @_;
 
  # alternate log format...
  s@^[[(](\d?\d:\d\d(:\d\d)?)[])] (.*)$@$3 {$1}@gs;    # leading timestamp
  s@^(\d?\d:\d\d(:\d\d)? ?([AP]M)?) (.*)$@$4 {$1}@gsi; # leading timestamp
 
  # leading time/date stamp
  s@^\[\d\d?/\d\d/\d\d \@ (\d?\d:\d\d(:\d\d)?)\]\s+(.*)$@$3 {$1}@gs;
 
  # IRSSI leading full date log format
  s@^\d\d?-...-\d\d\d\d (\d\d?:\d\d(:\d\d)?)\s+(.*)$@$3 {$1}@gs;
 
  # GAIM inline timestamps (alone on a line with leading whitespace)
  s@^  +((\d\d?:)?\d\d?:\d\d)$@*** $1@gs;
 
  # goofy name+host format...
  s@^\[msg\(([^()\[\] \t]+)\)\] @>> $1\t@gsi;
  s@^\[([^()\[\] \t]+)\(([^()\[\] \t]+)\)\] @<$1>\t@gsi;
 
  if (m@^\s*$@) {
    $prev_head = "";
    $bg_color = $bg_color1;
    my $color_style = '';
    if ($colorize_p) {
      $color_style = " STYLE=\"background:$bg_color\"";
    }
    return "<TR><TD COLSPAN=2$color_style><BR></TD></TR>\n";
  }
 
  my ($head, $body) = m@^([^\t]+)[\t]+(.*)$@s;
  my $stamp = undef;
 
  if (!defined($head)) {
 
    # it's best if the head and body are separated by a tab; but if we can't
    # get that, try for it separated by spaces.
#   if (m@^(<[^> \t\n]+>) (.*)$@s) {
    if (m@^(<[\@\+ ]?[^> \t\n]+>) (.*)$@s) {
      $head = $1;
      $body = $2;
    } elsif (m@^(\* [^> \t\n]+) (.*)$@s) {
      $head = $1;
      $body = $2;
    } elsif (m@^(\[ *[^\]]+\]) (.*)$@s) {
      $head = $1;
      $body = $2;
    } elsif (m@^([^\[\]<> \t\n:]+:) (.*)$@s) {
      $head = $1;
      $body = $2;
    } elsif (m@^(>) (.*)$@s) {
      $head = $1;
      $body = $2;
    } elsif (m@^(\*+ *[^\[\]<> \t\n:]+) (.*)$@s) {
      $head = $1;
      $body = $2;
    } else {
      $head = "";
      $body = $_;
      print STDERR "$progname: unparsable line $input_lines: $_\n" if $verbose;
    }
  }
 
  # If there's a timestamp at the end of the line, put it in column 3.
  # Otherwise, there is no column 3.
  if ($body =~
      m@^(.*?)\s*[({]?\s*(\d\d?:\d\d(:\d\d)?( ?[AP]M)?)\s*[)}]?\s*$@i) {
    $body = $1;
    $stamp = $2;
 
    if ($strip_timestamps) {
      $stamp = '';
    } elsif ($strip_seconds) {
      $stamp =~ s@^(\d?\d:\d\d):\d\d$@$1@;
    }
 
    if ($stamp eq $prev_stamp) {
      $stamp = undef;
    } else {
      $prev_stamp = $stamp;
    }
  }
 
 
  if ($strip_noise && $head =~ m@^(\[|\*\*\*)@) {
    print STDERR "$progname: deleting noise line $input_lines: $head\n"
        if $verbose;
    return "";
  }
 
  $head = convert_line_body ($head);
  $body = convert_line_body ($body);
 
  my $continuation = 1;
  my $color_changed_p = 0;
 
  if ($head ne $prev_head) {
    $prev_head = $head;
    $continuation = 0;
    $color_changed_p = 1;
    if ($bg_color eq $bg_color1) {
      $bg_color = $bg_color2;
    } else {
      $bg_color = $bg_color1;
    }
  }
 
  $head .= "&nbsp;";
 
  if ($head =~ m@^(\[|\*\*\*)@ ||
      $head =~ m@\(\s*\d\d\d+\s*\)@) {
    $head = "''$head''";
    $body = "''$body''";
 
  } elsif ($continuation) {
    $head = ("");
  } else {
    $head = "'''$head'''";
  }
 
  # Specify the foreground color in the table cells too, in case this
  # html gets pasted somwehere with conflicting document colors.
  #
  my $color_style = '';
 
  if ($separators_p && $color_changed_p && $output_lines != 0) {
    $color_style = $margin_style;
  } elsif ($colorize_p) {
    $color_style = (" STYLE=\"color:$fg_color" . 
                    ($bg_color eq $bg_color1 
                     ? ''
                     : "; background:$bg_color") .
                    "\"");
  }
 
  my $result = "|-\n" .
               "| $head\n" .
               "| $body\n";
 
  if ($stamp) {
    $result .= "| $stamp\n";
  }
 
 
  if ($line_tick++ > $chunk_size) {
    $line_tick = 0;
 
    $color_style = '';
    if ($bg_color ne $bg_color1) {
      if ($separators_p) {
        $color_style = $margin_style;
        } elsif ($colorize_p) {
          $color_style = " STYLE=\"background:$bg_color1\"";
        }
    }
  }
 
  $result =~ s@<TD VALIGN=TOP NOWRAP></TD>@<TD></TD>@g; # simplify...
  $result =~ s@ NOWRAP(>[^\s]+?</TD>)@$1@g; # if no spaces, don't need nowrap
 
  $output_lines++;
 
  return $result;
}
 
sub convert_color($) {
  my ($str) = @_;
 
  $str =~ s/\e\[.*?[a-zA-Z]//g;
 
  if ($str =~ /(<BR>)/i) {
    $str =~ s//\cO$1/g;
  } else {
    $str .= "\cO";
  }
 
  $str =~ s/\cV(.*?)\cV/\cC0,1$1\cO/g;
  $str =~ s/\cV/\cC0,1/;
 
  my @chars = (split(//, $str));
  my $ret = '';
  my ($CCfc, $CCbc, $CCnc);
  my $CCb  = 0;
  my $CCu  = 0;
  while (@chars) {
    my $char = shift @chars;
    if ($char eq "\cB")    { $ret .= ($CCb ? '</b>' : '<b>'); $CCb = !$CCb; }
    elsif ($char eq "\c_") { $ret .= ($CCu ? '</u>' : '<u>'); $CCu = !$CCu; }
    elsif ($char eq "\cO") {
      if ($CCb) { $CCb = 0; $ret .= '</b>'; }
      if ($CCu) { $CCu = 0; $ret .= '</u>'; }
      if ($CCnc) {
        $CCbc= 0; $ret .= '</SPAN>' x $CCnc;
        $CCfc= 0; $CCnc = 0; }
    } elsif ($char eq "\cC") {
      my $CCcs = '';
      while (($char = shift @chars) =~ /[\d,]/) {
        $CCcs .= $char;
      }
 
      if ($char =~ /[^\d,]/) {
        unshift @chars, $char;
      }
 
      if ($CCcs eq '') {
        if ($CCbc) { $ret .= '</SPAN>'; $CCnc--; }
        if ($CCfc) { $ret .= '</SPAN>'; $CCnc--; }
        $CCbc = undef; $CCfc = undef;
      } else {
        my @k = split /,/, $CCcs;
        if (defined($k[0]) && $k[0] ne '') {
          $CCfc = $k[0];
          $ret .= "<SPAN CLASS=fc$CCfc>";
          $any_styles++;
          $CCnc++;
        }
 
        if (defined($k[1]) && $k[1] ne '') {
          $CCbc = $k[1];
          $ret .= "<SPAN CLASS=bc$CCbc>";
          $any_styles++;
          $CCnc++;
        }
      }
    }
    else {
      $ret .= $char;
    }
  }
  return $ret;
}
 
 
my $buffered_line = undef;
sub convert($) {
  my($line) = @_;
 
  if ($line =~ m/^[A-Za-z]/ &&
      $line !~ m/^[^ \t\r\n:]+: /) {
    $buffered_line = '' unless defined ($buffered_line);
    $buffered_line .= $line;
    return "";
  } else {
    my $ret = (defined ($buffered_line)
               ? convert_line ($buffered_line)
               : "");
    $buffered_line = $line;
    return $ret;
  }
}
 
 
# convert everything in the given string.
sub convert_body($) {
  my ($body) = @_;
 
  my $color_style = '';
  if ($colorize_p) {
    $color_style = " STYLE=\"background:$bg_color\"";
  }
  my $output = "{|border=\"0\" cellpadding=\"5\" cellspacing=\"0\" align=\"center\"\n";
 
  $input_lines = 0;
  foreach (split ("\n", $body)) {
    $input_lines++;
    $output .= convert ($_);
  }
  $output .= convert ("");
  $output .= "|-\n|}";
 
  my $ss = ($any_styles ? $stylesheet : "");
  $_ = $doc_head;
  s/%%STYLESHEET%%/$ss/;
  $output = $_ . $output;
  return $output;
}
 
 
# This is the main loop when we seem to have been invoked as a CGI script.
#
sub do_cgi() {
  error (400, "malformed URL") if ($ENV{PATH_INFO} || $ENV{QUERY_STRING});
 
  if ($ENV{REQUEST_METHOD} eq 'GET') {
    #
    # GET means this is the top-level invocation: just display the HTML
    # for the form in which the user can paste an IRC log.
    #
    print STDOUT "Content-Type: text/html\n\n";
 
    print STDOUT
     ("<HTML>\n" .
      " <HEAD>\n" .
      "  <TITLE>$progname</TITLE>\n" .
      " </HEAD>\n" .
      " <BODY>\n" .
      "  <FORM METHOD=POST>\n" .
      "   <TABLE>\n" .
      "    <TR>\n" .
      "     <TD COLSPAN=2 VALIGN=TOP ALIGN=CENTER>\n" .
      "      <DIV ALIGN=CENTER>\n" .
      "       <B><SPAN STYLE='font-size:larger'>Chat log to HTML Converter<BR></SPAN>\n" .
      "        by <A HREF=\"http://www.jwz.org/\">" .
               "Jamie Zawinski</A><BR>\n" .
      "        Version <A HREF=\"http://www.jwz.org/hacks/irc2html.pl\">" .
      "$version</A>\n" .
      "      </SPAN>\n" .
      "      Paste your IRC/AIM log here:</B><BR>\n" .
      "      <TEXTAREA NAME=\"body\" ROWS=10 COLS=60 WRAP=OFF></TEXTAREA>\n" .
      "     </TD>\n" .
      "    </TR>\n" .
      "    <TR>\n" .
      "     <TD VALIGN=TOP ALIGN=LEFT NOWRAP>\n" .
      "      <INPUT NAME=\"strip_status\" TYPE=CHECKBOX>" .
             " Strip Status Lines<BR>\n" .
      "      <INPUT NAME=\"strip_timestamps\" TYPE=CHECKBOX>" .
             " Strip Timestamps<BR>\n" .
      "      <INPUT NAME=\"colorize\" TYPE=CHECKBOX CHECKED> Colorize\n" .
      "     </TD>\n" .
      "     <TD VALIGN=MIDDLE ALIGN=RIGHT NOWRAP>\n" .
      "      <INPUT TYPE=SUBMIT VALUE=\"Generate HTML\">\n" .
      "      &nbsp; &nbsp; &nbsp; \n" .
      "      <INPUT TYPE=RESET VALUE=\"Clear\">\n" .
      "     </TD>\n" .
      "    </TR>\n" .
      "   </TABLE>\n" .
      "  </FORM>\n" .
      " </BODY>\n" .
      "</HTML>\n");
 
  } elsif ($ENV{REQUEST_METHOD} eq 'POST') {
    #
    # POST means that the form has been submitted; read the log text and
    # print out the corresponding HTML.
    #
    my $args = '';
    while (<>) { $args .= $_; }
 
    $colorize_p = 0;   # for cgi, must default to 0
 
    my $body = '';
    foreach (split ('&', $args)) {
      my ($key, $val) = m/^(.*?)=(.*)$/s;
      if    ($key eq 'body')  { $body .= $val; }
      elsif ($key eq 'strip_status') { $strip_noise = ($val eq 'on'); }
      elsif ($key eq 'strip_timestamps') { $strip_timestamps = ($val eq 'on');}
      elsif ($key eq 'colorize') { $colorize_p = ($val eq 'on'); }
      else { error (400, "unknown option $key"); }
    }
 
    $separators_p = !$colorize_p;
#    $colorize_p = 1;####
 
    $body =~ s/\+/ /g;                           # spaces are encoded
    $body =~ s/%([\dA-F]{2})/chr(hex($1))/gexi;  # de-hexilate
    $body =~ s@\r\n@\n@sg;                       # CRLF -> LF
    $body =~ s@\r@\n@sg;                         # CR -> LF
 
    print STDOUT "Content-Type: text/html\n\n";
    print STDOUT convert_body ($body);
  } else {
    error (400, "$ENV{REQUEST_METHOD} not supported");
  }
}
 
sub error($$) {
  my ($http_status, $err) = @_;
 
  if (defined($ENV{REQUEST_URI})) {
    print "Status: $http_status\n";
    print "Content-Type: text/html\n";
    print "\n<TITLE>Error</TITLE>\n";
    print "<H1>$http_status</H1><P>\n";
    $err =~ s/&/&amp;/g;
    $err =~ s/</&lt;/g;
    $err =~ s/>/&gt;/g;
    print "$err\n<P>\n";
    exit (0);
 
  } else {
    print STDERR "$progname: $err\n";
    exit 1;
  }
}
 
sub usage() {
  print STDERR "usage: $progname [--verbose] [--strip] [--no-color]\n" .
               "                 [input-chat-log] [output-html-file]\n";
  exit 1;
}
 
sub main() {
 
  my $in  = undef;
  my $out = undef;
 
  if (defined ($ENV{REQUEST_URI})) {
    return do_cgi();
  }
 
  while ($_ = $ARGV[0]) {
    shift @ARGV;
    if ($_ eq "--verbose") { $verbose++; }
    elsif ($_ eq "--strip") { $strip_noise++; }
    elsif ($_ eq "--no-time") { $strip_timestamps++; }
    elsif ($_ eq "--no-color") { $colorize_p = 0; $separators_p = 1; }
    elsif (m/^-v+$/) { $verbose += length($_)-1; }
    elsif (m/^-./) { usage; }
    elsif (!defined($in)) { $in = $_; }
    elsif (!defined($out)) { $out = $_; }
    else { usage; }
  }
 
  $in  = "-" unless $in;
  $out = "-" unless $out;
 
  local *IN;
  local *OUT;
  open (IN, "<$in")   || die "$progname: unable to read $in: $!\n";
  open (OUT, ">$out") || die "$progname: unable to write $out: $!\n";
 
  $in  = "stdin"  if $in  eq "-";
  $out = "stdout" if $out eq "-";
  if ($verbose) {
    print STDERR "$progname: converting $in to $out...\n";
  }
 
  my $body = '';
  $body .= $_ while (<IN>);
  print OUT convert_body ($body);
  close OUT;
  close IN;
 
  if ($verbose) {
    print STDERR "$progname: wrote $out ($output_lines lines).\n";
  }
}
 
main();
exit 0;
```

