<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="8.7.1.79">
<package-comment/>
<businessobject displayString="6 - v3 20220520 dync body" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">v3 20220520 dync body</comment>
<endNode id="2">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="3">Stop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="4">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="5" type="java.util.HashSet">
<item id="6" type="com.j2fe.workflow.definition.Transition">
<name id="7">empty</name>
<source id="8">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="9">add current user to recipients</name>
<nodeHandler>com.j2fe.general.activities.ArrayHelper</nodeHandler>
<nodeHandlerClass id="10">com.j2fe.general.activities.ArrayHelper</nodeHandlerClass>
<parameters id="11" type="java.util.HashSet">
<item id="12" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="13">addElements</name>
<stringValue id="14">UserEmail</stringValue>
<type>VARIABLE</type>
</item>
<item id="15" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="16">array</name>
<stringValue id="17">recipientList</stringValue>
<type>VARIABLE</type>
</item>
<item id="18" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="19">array</name>
<stringValue id="20">recipientList</stringValue>
<type>VARIABLE</type>
</item>
<item id="21" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="22">duplicatesAllowed</name>
<objectValue id="23" type="java.lang.Boolean">false</objectValue>
<type>CONSTANT</type>
</item>
</parameters>
<persistentVariables id="24" type="java.util.HashSet">
<item id="25" type="java.lang.String">id
1000</item>
<item id="26" type="java.lang.String">recipientList
1000</item>
<item id="27" type="java.lang.String">body
1000</item>
<item id="28" type="java.lang.String">subject
1000</item>
</persistentVariables>
<sources id="29" type="java.util.HashSet">
<item id="30" type="com.j2fe.workflow.definition.Transition">
<name id="31">goto-next</name>
<source id="32">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="33">dync email body</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="34">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="35" type="java.util.HashSet">
<item id="36" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="37">statements</name>
<stringValue id="38">if  (emailBody != null) {&#13;
	if (fileURI != null) {&#13;
		String fileName = fileURI.substring(fileURI.lastIndexOf("/")+1);&#13;
		fileName = fileName.substring(9);&#13;
		emailBody = emailBody.replace("$fileName$", fileName);&#13;
	}&#13;
	if (userId != null) {&#13;
		emailBody = emailBody.replace("$userId$", userId);&#13;
	}&#13;
}</stringValue>
<type>CONSTANT</type>
</item>
<item id="39" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="40">["emailBody"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="41">variables["emailBody"]</name>
<stringValue id="42">body</stringValue>
<type>VARIABLE</type>
</item>
<item id="43" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="44">["emailBody"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="45">variables["emailBody"]</name>
<stringValue id="46">emailBody</stringValue>
<type>VARIABLE</type>
</item>
<item id="47" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="48">["fileURI"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="49">variables["fileURI"]</name>
<stringValue id="50">File</stringValue>
<type>VARIABLE</type>
</item>
<item id="51" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="52">["userId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="53">variables["userId"]</name>
<stringValue id="54">UserEmail</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="55" type="java.util.HashSet">
<item id="56" type="com.j2fe.workflow.definition.Transition">
<name id="57">goto-next</name>
<source id="58">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="59">get recipients</name>
<nodeHandler>com.j2fe.xenomorph.activities.StringToArray</nodeHandler>
<nodeHandlerClass id="60">com.j2fe.xenomorph.activities.StringToArray</nodeHandlerClass>
<parameters id="61" type="java.util.HashSet">
<item id="62" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="63">delimiter</name>
<stringValue id="64">;</stringValue>
<type>CONSTANT</type>
</item>
<item id="65" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="66">inputString</name>
<stringValue id="67">recipients</stringValue>
<type>VARIABLE</type>
</item>
<item id="68" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="69">returnArray</name>
<stringValue id="70">recipientList</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="71" type="java.util.HashSet">
<item id="72" type="com.j2fe.workflow.definition.Transition">
<name id="73">rows-found</name>
<source id="74">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="75">fetch email details</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="76">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="77" type="java.util.HashSet">
<item id="78" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="79">database</name>
<stringValue id="80">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="81" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="82">indexedParameters[0]</name>
<stringValue id="83">EmailId</stringValue>
<type>VARIABLE</type>
</item>
<item id="84" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="85">indexedResult[0][0]</name>
<stringValue id="86">id</stringValue>
<type>VARIABLE</type>
</item>
<item id="87" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="88">[0][1]@java/lang/Object@</UITypeHint>
<input>false</input>
<name id="89">indexedResult[0][1]</name>
<stringValue id="90">subject</stringValue>
<type>VARIABLE</type>
</item>
<item id="91" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="92">indexedResult[0][2]</name>
<stringValue id="93">recipients</stringValue>
<type>VARIABLE</type>
</item>
<item id="94" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="95">indexedResult[0][3]</name>
<stringValue id="96">body</stringValue>
<type>VARIABLE</type>
</item>
<item id="97" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="98">indexedResult[0][4]</name>
<stringValue id="99">from</stringValue>
<type>VARIABLE</type>
</item>
<item id="100" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="101">querySQL</name>
<stringValue id="102">select xt.* &#13;
 from FT_CFG_RSRC rsrc, &#13;
 XMLTABLE(&#13;
    '/notifications/email' PASSING xmltype(rsrc.content,871) COLUMNS &#13;
    id varchar(256) path 'id', &#13;
    subject VARCHAR2(256) path 'subject',&#13;
    recipients VARCHAR2(256) path 'recipients',&#13;
    body  VARCHAR2(256) path 'body',&#13;
    frm varchar(256) path 'from'&#13;
    ) xt &#13;
 where URI = 'db://resource/xml/config/notification.config.xml'&#13;
 and xt.id = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="103" type="java.util.HashSet">
<item id="104" type="com.j2fe.workflow.definition.Transition">
<name id="105">goto-next</name>
<source id="106">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="107">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="108">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="109" type="java.util.HashSet"/>
<targets id="110" type="java.util.HashSet">
<item idref="104" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="74"/>
</item>
</sources>
<targets id="111" type="java.util.HashSet">
<item id="112" type="com.j2fe.workflow.definition.Transition">
<name id="113">nothing-found</name>
<source idref="74"/>
<target idref="2"/>
</item>
<item idref="72" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="58"/>
</item>
</sources>
<targets id="114" type="java.util.HashSet">
<item idref="56" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="32"/>
</item>
</sources>
<targets id="115" type="java.util.HashSet">
<item idref="30" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="8"/>
</item>
</sources>
<targets id="116" type="java.util.HashSet">
<item idref="6" type="com.j2fe.workflow.definition.Transition"/>
<item id="117" type="com.j2fe.workflow.definition.Transition">
<name id="118">not-empty</name>
<source idref="8"/>
<target id="119">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="120">Email</name>
<nodeHandler>com.j2fe.general.activities.EMAIL</nodeHandler>
<nodeHandlerClass id="121">com.j2fe.general.activities.EMAIL</nodeHandlerClass>
<parameters id="122" type="java.util.HashSet">
<item id="123" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="124">emailText</name>
<stringValue id="125">emailBody</stringValue>
<type>VARIABLE</type>
</item>
<item id="126" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="127">from</name>
<stringValue id="128">from</stringValue>
<type>VARIABLE</type>
</item>
<item id="129" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="130">mimeType</name>
<stringValue id="131">text/html</stringValue>
<type>CONSTANT</type>
</item>
<item id="132" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="133">recipients</name>
<stringValue id="134">recipientList</stringValue>
<type>VARIABLE</type>
</item>
<item id="135" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="136">session</name>
<stringValue id="137">email/session</stringValue>
<type>REFERENCE</type>
</item>
<item id="138" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="139">subject</name>
<stringValue id="140">subject</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="141" type="java.util.HashSet">
<item idref="117" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="142" type="java.util.HashSet">
<item id="143" type="com.j2fe.workflow.definition.Transition">
<name id="144">goto-next</name>
<source idref="119"/>
<target idref="2"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="2"/>
</item>
<item idref="143" type="com.j2fe.workflow.definition.Transition"/>
<item idref="112" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="145" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="146">Custom</group>
<haltOnError>false</haltOnError>
<lastChangeUser id="147">user1</lastChangeUser>
<lastUpdate id="148">2022-05-20T14:03:09.000+0800</lastUpdate>
<name id="149">EmailNotification</name>
<optimize>true</optimize>
<parameter id="150" type="java.util.HashMap">
<entry>
<key id="151" type="java.lang.String">EmailId</key>
<value id="152" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="153">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="154">id defined in config.xml</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="155" type="java.lang.String">File</key>
<value id="156" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="157">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="158" type="java.lang.String">UserEmail</key>
<value id="159" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="160">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="161" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="106"/>
<status>RELEASED</status>
<variables id="162" type="java.util.HashMap">
<entry>
<key id="163" type="java.lang.String">EmailId</key>
<value id="164" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="165">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="166">id defined in config.xml</description>
<persistent>true</persistent>
<value id="167" type="java.lang.String">manual-upload-success</value>
</value>
</entry>
<entry>
<key id="168" type="java.lang.String">File</key>
<value id="169" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="170">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
</value>
</entry>
<entry>
<key id="171" type="java.lang.String">UserEmail</key>
<value id="172" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="173">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
</value>
</entry>
</variables>
<version>6</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
