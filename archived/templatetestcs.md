---
title: "TemplateTest.cs"
lastmodified: '2005-02-25'
redirect_from:
  - /TemplateTest.cs/
---

TemplateTest.cs
===============

    // this is a template for making NUnit tests.  Text enclosed 
    // in square brackets (and the brackets themselves) should be 
    // replaced by appropiate code.
    //
    // [File Name].cs - NUnit Test Cases for [explain here]
    //
    // [Author Name] ([Author email Address])
    //
    // (C) [Copyright holder]
    // 

    // these are the standard namespaces you will need.  You may 
    // need to add more depending on your tests.

    using NUnit.Framework;
    using System;

    // all test namespaces start with "MonoTests."  Append the 
    // Namespace that contains the class you are testing, e.g. 
    // MonoTests.System.Collections
    namespace MonoTests.[Namespace]
    {

        // the class name should end with "Test" and start with the name 
        // of the class you are testing, e.g. CollectionBaseTest
        public class [Class to be tested]Test : TestCase {
        
        // there should be two constructors for your class.  The first 
        // one (without parameters) should set the name to something 
        // unique.
        // Of course the name of the method is the same as the name of 
        // the class
        public [Constructor]() : base ("[Namespace.Class]") {}
        public [Constructor](string name) : base(name) {}

        // this method is run before each Test* method is called. You 
        // can put variable initialization, etc. here that is common to 
        // each test.
        // Just leave the method empty if you don't need to use it.
        protected override void SetUp() {}

        // this method is run after each Test* method is called. You 
        // can put clean-up code, etc. here.  Whatever needs to be done 
        // after each test. Just leave the method empty if you don't need 
        // to use it.
        protected override void TearDown() {}

        // this property is required.  You need change the parameter for
        // typeof() below to be your class.
        public static ITest Suite {
            get { 
                return new TestSuite(typeof([Classname here])); 
            }
        }

        // this is just one of probably many test methods in your test 
        // class. each test method must start with "Test".  All methods 
        // in your class which start with "Test" will be automagically 
        // called by the NUnit framework.
        public void Test[Something] {
            // inside here you will exercise your class and then 
            // call Assert()
        }
    }

