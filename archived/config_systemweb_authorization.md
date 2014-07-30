---
title: "Config system.web authorization"
lastmodified: '2008-06-25'
permalink: /archived/Config_system.web_authorization/
redirect_from:
  - /Config_system.web_authorization/
---

Config system.web authorization
===============================

An example of this [\<system.web\>]({{ site.github.url }}/Config_system.web "Config system.web") section is:

``` xml
<authorization>
  <allow users="username" roles="role1,role2" verbs="GET,POST" />
  <deny users="user1,user2" verbs="POST" />
</authorization>
```

Both *users* and *roles* allow the use of a wildcard character:

-   **?**: matches unauthenticated users/roles.
-   **\***: matches all users/roles.

By default, all users are authorized (machine.config), so as long as there is no *deny* match for an user, the request will proceed. Rules set in higher level virtual directories take precedence over the ones in the current directory.

### "users"

It should be either a wildcard or a comma-separated list of user names.

### "roles"

It should be either a wildcard or a comma-separated list of role names.

### "verbs"

Comma-separated list of HTTP verbs (GET, POST, HEAD).

