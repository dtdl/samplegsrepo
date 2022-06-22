<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="8.7.1.79">
<package-comment/>
<businessobject displayString="2 - 20220614 v1" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">20220614 v1</comment>
<endNode id="2">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="3">Stop</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="4">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="5" type="java.util.HashSet">
<item id="6" type="com.j2fe.workflow.definition.Transition">
<name id="7">goto-next</name>
<source id="8">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="9">notify success</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="10">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="11" type="java.util.HashSet">
<item id="12" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="13">["EmailId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="14">input["EmailId"]</name>
<stringValue id="15">manual-publish-success</stringValue>
<type>CONSTANT</type>
</item>
<item id="16" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="17">["UserEmail"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="18">input["UserEmail"]</name>
<stringValue id="19">userEmail</stringValue>
<type>VARIABLE</type>
</item>
<item id="20" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="21">name</name>
<stringValue id="22">EmailNotification</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="23" type="java.util.HashSet">
<item id="24" type="com.j2fe.workflow.definition.Transition">
<name id="25">goto-next</name>
<source id="26">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="27">Call Subworkflow</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="28">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="29" type="java.util.HashSet">
<item id="30" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="31">["ForceProcessing"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="32">input["ForceProcessing"]</name>
<stringValue id="33">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="34" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="35">["InlineAOIProcessing"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="36">input["InlineAOIProcessing"]</name>
<stringValue id="37">false</stringValue>
<type>CONSTANT</type>
</item>
<item id="38" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="39">["No. Of Parallel Branches"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="40">input["No. Of Parallel Branches"]</name>
<stringValue id="41">4</stringValue>
<type>CONSTANT</type>
</item>
<item id="42" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="43">["PublishingBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="44">input["PublishingBulkSize"]</name>
<stringValue id="45">500</stringValue>
<type>CONSTANT</type>
</item>
<item id="46" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="47">["PublishingFileName_Gold"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="48">input["PublishingFileName_Gold"]</name>
<stringValue id="49">GoldenRep.csv</stringValue>
<type>CONSTANT</type>
</item>
<item id="50" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="51">["PublishingFileName_PRZ"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="52">input["PublishingFileName_PRZ"]</name>
<stringValue id="53">PRZIASAT.txt</stringValue>
<type>CONSTANT</type>
</item>
<item id="54" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="55">["SubscriptionID_Gold"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="56">input["SubscriptionID_Gold"]</name>
<stringValue id="57">123</stringValue>
<type>CONSTANT</type>
</item>
<item id="58" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="59">["SubscriptionID_PRZ"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="60">input["SubscriptionID_PRZ"]</name>
<stringValue id="61">123</stringValue>
<type>CONSTANT</type>
</item>
<item id="62" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="63">["SubscriptionName_Gold"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="64">input["SubscriptionName_Gold"]</name>
<stringValue id="65">ICCREA_GoldenRecord_Date</stringValue>
<type>CONSTANT</type>
</item>
<item id="66" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="67">["SubscriptionName_PRZ"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="68">input["SubscriptionName_PRZ"]</name>
<stringValue id="69">ICCREA_PRZIASAT_publish</stringValue>
<type>CONSTANT</type>
</item>
<item id="70" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="71">["TriggerPublishing"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="72">input["TriggerPublishing"]</name>
<stringValue id="73">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="74" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="75">name</name>
<stringValue id="76">ICCREA_Price_Publishing_Consolidated</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="77" type="java.util.HashSet">
<item id="78" type="com.j2fe.workflow.definition.Transition">
<name id="79">goto-next</name>
<source id="80">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="81">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="82">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="83" type="java.util.HashSet"/>
<targets id="84" type="java.util.HashSet">
<item idref="78" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="26"/>
</item>
</sources>
<targets id="85" type="java.util.HashSet">
<item idref="24" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="8"/>
</item>
</sources>
<targets id="86" type="java.util.HashSet">
<item idref="6" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
</sources>
<targets id="87" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="88">Custom/Publishing</group>
<haltOnError>true</haltOnError>
<lastChangeUser id="89">user1</lastChangeUser>
<lastUpdate id="90">2022-06-14T14:55:12.000+0800</lastUpdate>
<name id="91">ICCREA_UIPricePublishingConsolidated</name>
<optimize>true</optimize>
<parameter id="92" type="java.util.HashMap">
<entry>
<key id="93" type="java.lang.String">userEmail</key>
<value id="94" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="95">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="96" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>true</purgeAtEnd>
<retries>0</retries>
<startNode idref="80"/>
<status>RELEASED</status>
<variables id="97" type="java.util.HashMap">
<entry>
<key id="98" type="java.lang.String">userEmail</key>
<value id="99" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="100">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>2</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
