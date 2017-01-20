<#ftl strict_syntax=false>
<#--
  Licensed to the Apache Software Foundation (ASF) under one
  or more contributor license agreements.  See the NOTICE file
  distributed with this work for additional information
  regarding copyright ownership.  The ASF licenses this file
  to you under the Apache License, Version 2.0 (the
  "License"); you may not use this file except in compliance
  with the License.  You may obtain a copy of the License at
  
    http://www.apache.org/licenses/LICENSE-2.0
  
  Unless required by applicable law or agreed to in writing,
  software distributed under the License is distributed on an
  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
  KIND, either express or implied.  See the License for the
  specific language governing permissions and limitations
  under the License.
-->
<#assign htmlEscape = "freemarker.template.utility.HtmlEscape"?new(),
         utility = "freemarker.test.templatesuite.models.TransformHashWrapper"?new()>
<html>
<head>
<title>FreeMarker: Transformation Test</title>
</head>
<body>

<p>A simple test follows:</p>

<p>${message}</p>

<@htmlEscape>
<p>${message}</p>
</@htmlEscape>

<P>Now try the Utility package:</p>
<p>${utility}</p>

<transform utility.htmlEscape>
<p>${utility}</p>
</transform>

<p>Now some nested transforms:</p>
<transform utility.compress>
<p    >This tests the compress transformation</p >
</transform>
<@utility.compress>
<transform utility.htmlEscape>
<p    >This tests the compress transformation</p >
</transform>
</@utility.compress>
<#assign html_transform = "freemarker.template.utility.HtmlEscape"?new() />
<transform html_transform><#--Using the transform via an instantiation -->
<transform utility.compress>
<p    >This tests the compress transformation</p >
</transform>
</transform>

<p>Now try method and transform interactions:</p>
<transform utility.escape( "xml" )>
<p>This isn't a valid XML string.</p>
</transform>
<transform utility.escape( "html" )>
<p>This isn't a valid HTML string.</p>
</transform>

<p>A more advanced interaction involves getting a TemplateMethodModel
to initialise a TemplateTransformModel, as follow:</p>

<transform utility.special( "This is a comment" )>
Comment: *

A test string containing quotes: "This isn't a test".
A test string containing amps: Fish & Chips.
A test string containing tags: <p>Fish &amp; Chips.</p>
</transform>

<transform utility.special( "This is a second comment", "quote" )>
Comment: *

A test string containing quotes: "This isn't a test".
A test string containing amps: Fish & Chips.
A test string containing tags: <p>Fish &amp; Chips.</p>
</transform>
<transform utility.special( "This is a third comment", "ampersand", "quote" )>
Comment: *

A test string containing quotes: "This isn't a test".
A test string containing amps: Fish & Chips.
A test string containing tags: <p>Fish &amp; Chips.</p>
</transform>
<transform utility.special( "tag", utility )>
Comment: *

A test string containing quotes: "This isn't a test".
A test string containing amps: Fish & Chips.
A test string containing tags: <p>Fish &amp; Chips.</p>
</transform>

</body>
</html>
