<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="8.7.1.79">
<package-comment/>
<businessobject displayString="30 - v1020220527 halt on error" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">v1020220527 halt on error</comment>
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
<name id="9">Close Job</name>
<nodeHandler>com.j2fe.streetlamp.activities.CloseJob</nodeHandler>
<nodeHandlerClass id="10">com.j2fe.streetlamp.activities.CloseJob</nodeHandlerClass>
<parameters id="11" type="java.util.HashSet">
<item id="12" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="13">jobId</name>
<stringValue id="14">jobId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="15" type="java.util.HashSet">
<item id="16" type="com.j2fe.workflow.definition.Transition">
<name id="17">goto-next</name>
<source id="18">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="19">notify conflict</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="20">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="21" type="java.util.HashSet">
<item id="22" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="23">["EmailId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="24">input["EmailId"]</name>
<stringValue id="25">manual-upload-conflict</stringValue>
<type>CONSTANT</type>
</item>
<item id="26" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="27">["File"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="28">input["File"]</name>
<stringValue id="29">File</stringValue>
<type>VARIABLE</type>
</item>
<item id="30" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="31">["UserEmail"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="32">input["UserEmail"]</name>
<stringValue id="33">userEmail</stringValue>
<type>VARIABLE</type>
</item>
<item id="34" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="35">name</name>
<stringValue id="36">EmailNotification</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="37" type="java.util.HashSet">
<item id="38" type="com.j2fe.workflow.definition.Transition">
<name id="39">rows-found</name>
<source id="40">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="41">check running instances</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="42">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="43" type="java.util.HashSet">
<item id="44" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="45">database</name>
<stringValue id="46">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="47" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="48">querySQL</name>
<stringValue id="49">select 1 from FT_WF_WFRI wfri, ft_wf_wfdf wfdf where 1=1&#13;
and wfri.workflow_id = wfdf.workflow_id&#13;
and wfri.wf_runtime_stat_typ = 'STARTED'&#13;
and wfri.workflow_end_tms is null&#13;
and wfri.workflow_start_tms &gt; sysdate - 1&#13;
and wfdf.workflow_nme in ('ICCREA_Price_Publishing', 'ICCREA_Price_Publishing_Consolidated', 'PriceValidationWrapper', 'Price Validation Consolidated')&#13;
and rownum = 1</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="50" type="java.util.HashSet">
<item id="51" type="com.j2fe.workflow.definition.Transition">
<name id="52">goto-next</name>
<source id="53">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="54">load from rsrc</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="55">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="56" type="java.util.HashSet">
<item id="57" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="58">["BulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="59">input["BulkSize"]</name>
<stringValue id="60">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="61" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="62">["File"]@java/net/URI@</UITypeHint>
<input>true</input>
<name id="63">input["File"]</name>
<stringValue id="64">File</stringValue>
<type>VARIABLE</type>
</item>
<item id="65" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="66">["MessageType"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="67">input["MessageType"]</name>
<stringValue id="68">MessageType</stringValue>
<type>VARIABLE</type>
</item>
<item id="69" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="70">["Parallel File Load Sub"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="71">input["Parallel File Load Sub"]</name>
<stringValue id="72">Parallel File Load Sub</stringValue>
<type>CONSTANT</type>
</item>
<item id="73" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="74">["ParallelBranches"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="75">input["ParallelBranches"]</name>
<stringValue id="76">ParallelBranches</stringValue>
<type>VARIABLE</type>
</item>
<item id="77" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="78">["ParentJobId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="79">input["ParentJobId"]</name>
<stringValue id="80">jobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="81" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="82">name</name>
<stringValue id="83">Standard File Load</stringValue>
<type>CONSTANT</type>
</item>
<item id="84" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="85">["JobId"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="86">output["JobId"]</name>
<stringValue id="87">FileLoadJobId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="88" type="java.util.HashSet">
<item id="89" type="com.j2fe.workflow.definition.Transition">
<name id="90">false</name>
<source id="91">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="92">is Null File?</name>
<nodeHandler>com.j2fe.general.activities.IsNull</nodeHandler>
<nodeHandlerClass id="93">com.j2fe.general.activities.IsNull</nodeHandlerClass>
<parameters id="94" type="java.util.HashSet">
<item id="95" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="96">input</name>
<stringValue id="97">File</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="98" type="java.util.HashSet">
<item id="99" type="com.j2fe.workflow.definition.Transition">
<name id="100">goto-next</name>
<source id="101">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="102">Database Select (Standard)</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="103">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="104" type="java.util.HashSet">
<item id="105" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="106">database</name>
<stringValue id="107">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="108" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="109">firstColumnsResult[0]</name>
<stringValue id="110">userEmail</stringValue>
<type>VARIABLE</type>
</item>
<item id="111" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="112">indexedParameters[0]</name>
<stringValue id="113">CurrentUser</stringValue>
<type>VARIABLE</type>
</item>
<item id="114" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="115">querySQL</name>
<stringValue id="116">select usr_desc from ft_t_AUSR where end_tms is null&#13;
and usr_id = ?</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="117" type="java.util.HashSet">
<item id="118" type="com.j2fe.workflow.definition.Transition">
<name id="119">goto-next</name>
<source id="120">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="121">Create Job</name>
<nodeHandler>com.j2fe.streetlamp.activities.CreateJob</nodeHandler>
<nodeHandlerClass id="122">com.j2fe.streetlamp.activities.CreateJob</nodeHandlerClass>
<parameters id="123" type="java.util.HashSet">
<item id="124" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="125">configInfo</name>
<stringValue id="126">Manual Bulk Prices Parent Job</stringValue>
<type>CONSTANT</type>
</item>
<item id="127" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="128">file</name>
<objectValue id="129" type="java.net.URI">ManualBulkPricesParentJob</objectValue>
<type>CONSTANT</type>
</item>
<item id="130" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="131">flushImmediate</name>
<objectValue id="132" type="java.lang.Boolean">true</objectValue>
<type>CONSTANT</type>
</item>
<item id="133" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="134">jobId</name>
<stringValue id="135">jobId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="136" type="java.util.HashSet">
<item id="137" type="com.j2fe.workflow.definition.Transition">
<name id="138">goto-next</name>
<source id="139">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="140">Start</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="141">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="142" type="java.util.HashSet"/>
<targets id="143" type="java.util.HashSet">
<item idref="137" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="120"/>
</item>
</sources>
<targets id="144" type="java.util.HashSet">
<item idref="118" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="101"/>
</item>
</sources>
<targets id="145" type="java.util.HashSet">
<item idref="99" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="91"/>
</item>
</sources>
<targets id="146" type="java.util.HashSet">
<item idref="89" type="com.j2fe.workflow.definition.Transition"/>
<item id="147" type="com.j2fe.workflow.definition.Transition">
<name id="148">true</name>
<source idref="91"/>
<target id="149">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="150">notify no file</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="151">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="152" type="java.util.HashSet">
<item id="153" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="154">["EmailId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="155">input["EmailId"]</name>
<stringValue id="156">manual-upload-blank</stringValue>
<type>CONSTANT</type>
</item>
<item id="157" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="158">["File"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="159">input["File"]</name>
<stringValue id="160">File</stringValue>
<type>VARIABLE</type>
</item>
<item id="161" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="162">["UserEmail"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="163">input["UserEmail"]</name>
<stringValue id="164">userEmail</stringValue>
<type>VARIABLE</type>
</item>
<item id="165" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="166">name</name>
<stringValue id="167">EmailNotification</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="168" type="java.util.HashSet">
<item idref="147" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="169" type="java.util.HashSet">
<item id="170" type="com.j2fe.workflow.definition.Transition">
<name id="171">goto-next</name>
<source idref="149"/>
<target idref="8"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="53"/>
</item>
</sources>
<targets id="172" type="java.util.HashSet">
<item idref="51" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="40"/>
</item>
</sources>
<targets id="173" type="java.util.HashSet">
<item id="174" type="com.j2fe.workflow.definition.Transition">
<name id="175">nothing-found</name>
<source idref="40"/>
<target id="176">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="177">Database Select (Xor Split)</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="178">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="179" type="java.util.HashSet">
<item id="180" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="181">database</name>
<stringValue id="182">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="183" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="184">indexedParameters[0]</name>
<stringValue id="185">FileLoadJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="186" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="187">querySQL</name>
<stringValue id="188">select 1 from ft_t_trid where 1=1&#13;
and job_id = ?&#13;
and input_msg_typ = 'ManualBulkUploadPrices'&#13;
and crrnt_severity_cde &lt;= 30&#13;
and rownum =1</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="189" type="java.util.HashSet">
<item idref="174" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="190" type="java.util.HashSet">
<item id="191" type="com.j2fe.workflow.definition.Transition">
<name id="192">nothing-found</name>
<source idref="176"/>
<target id="193">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="194">dump rsrc</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="195">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="196" type="java.util.HashSet">
<item id="197" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="198">["DoDeleteFile"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="199">input["DoDeleteFile"]</name>
<stringValue id="200">DoDelete</stringValue>
<type>VARIABLE</type>
</item>
<item id="201" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="202">["FileURI"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="203">input["FileURI"]</name>
<stringValue id="204">File</stringValue>
<type>VARIABLE</type>
</item>
<item id="205" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="206">["UploadFolder"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="207">input["UploadFolder"]</name>
<stringValue id="208">UploadFolder</stringValue>
<type>VARIABLE</type>
</item>
<item id="209" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="210">name</name>
<stringValue id="211">DumpRSRC2File</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="212" type="java.util.HashSet">
<item idref="191" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="213" type="java.util.HashSet">
<item id="214" type="com.j2fe.workflow.definition.Transition">
<name id="215">goto-next</name>
<source idref="193"/>
<target id="216">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="217">notify failed</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="218">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="219" type="java.util.HashSet">
<item id="220" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="221">["EmailId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="222">input["EmailId"]</name>
<stringValue id="223">manual-upload-failed</stringValue>
<type>CONSTANT</type>
</item>
<item id="224" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="225">["File"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="226">input["File"]</name>
<stringValue id="227">File</stringValue>
<type>VARIABLE</type>
</item>
<item id="228" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="229">["UserEmail"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="230">input["UserEmail"]</name>
<stringValue id="231">userEmail</stringValue>
<type>VARIABLE</type>
</item>
<item id="232" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="233">name</name>
<stringValue id="234">EmailNotification</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="235" type="java.util.HashSet">
<item idref="214" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="236" type="java.util.HashSet">
<item id="237" type="com.j2fe.workflow.definition.Transition">
<name id="238">goto-next</name>
<source idref="216"/>
<target idref="8"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
<item id="239" type="com.j2fe.workflow.definition.Transition">
<name id="240">rows-found</name>
<source idref="176"/>
<target id="241">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="242">run PVC</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="243">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="244" type="java.util.HashSet">
<item id="245" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="246">["BulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="247">input["BulkSize"]</name>
<stringValue id="248">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="249" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="250">["DataSource"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="251">input["DataSource"]</name>
<stringValue id="252">DataSource</stringValue>
<type>VARIABLE</type>
</item>
<item id="253" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="254">["DoCleanup"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="255">input["DoCleanup"]</name>
<stringValue id="256">DoCleanup</stringValue>
<type>VARIABLE</type>
</item>
<item id="257" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="258">["DoFVH"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="259">input["DoFVH"]</name>
<stringValue id="260">DoFVH</stringValue>
<type>VARIABLE</type>
</item>
<item id="261" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="262">["DoValidations"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="263">input["DoValidations"]</name>
<stringValue id="264">DoValidations</stringValue>
<type>VARIABLE</type>
</item>
<item id="265" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="266">["FileLoadJobId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="267">input["FileLoadJobId"]</name>
<stringValue id="268">FileLoadJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="269" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="270">["ThreadsInParallel"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="271">input["ThreadsInParallel"]</name>
<stringValue id="272">ParallelBranches</stringValue>
<type>VARIABLE</type>
</item>
<item id="273" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="274">name</name>
<stringValue id="275">ManualBulkUploadReRunPVCWrapper</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="276" type="java.util.HashSet">
<item idref="239" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="277" type="java.util.HashSet">
<item id="278" type="com.j2fe.workflow.definition.Transition">
<name id="279">goto-next</name>
<source idref="241"/>
<target id="280">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="281">publish</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="282">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="283" type="java.util.HashSet">
<item id="284" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="285">["ForceProcessing"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="286">input["ForceProcessing"]</name>
<stringValue id="287">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="288" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="289">["InlineAOIProcessing"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="290">input["InlineAOIProcessing"]</name>
<objectValue id="291" type="java.lang.Boolean">false</objectValue>
<type>CONSTANT</type>
</item>
<item id="292" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="293">["No. Of Parallel Branches"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="294">input["No. Of Parallel Branches"]</name>
<objectValue id="295" type="java.lang.Integer">4</objectValue>
<type>CONSTANT</type>
</item>
<item id="296" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="297">["PublishingBulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="298">input["PublishingBulkSize"]</name>
<objectValue id="299" type="java.lang.Integer">500</objectValue>
<type>CONSTANT</type>
</item>
<item id="300" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="301">["PublishingFileName_Gold"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="302">input["PublishingFileName_Gold"]</name>
<stringValue id="303">GoldenRep.csv</stringValue>
<type>CONSTANT</type>
</item>
<item id="304" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="305">["PublishingFileName_PRZ"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="306">input["PublishingFileName_PRZ"]</name>
<stringValue id="307">PRZIASAT.txt</stringValue>
<type>CONSTANT</type>
</item>
<item id="308" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="309">["SubscriptionID_Gold"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="310">input["SubscriptionID_Gold"]</name>
<stringValue id="311">any</stringValue>
<type>CONSTANT</type>
</item>
<item id="312" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="313">["SubscriptionID_PRZ"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="314">input["SubscriptionID_PRZ"]</name>
<stringValue id="315">any</stringValue>
<type>CONSTANT</type>
</item>
<item id="316" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="317">["SubscriptionName_Gold"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="318">input["SubscriptionName_Gold"]</name>
<stringValue id="319">ICCREA_GoldenRecord_Date</stringValue>
<type>CONSTANT</type>
</item>
<item id="320" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="321">["SubscriptionName_PRZ"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="322">input["SubscriptionName_PRZ"]</name>
<stringValue id="323">ICCREA_PRZIASAT_publish</stringValue>
<type>CONSTANT</type>
</item>
<item id="324" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="325">["TriggerPublishing"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="326">input["TriggerPublishing"]</name>
<objectValue idref="132"/>
<type>CONSTANT</type>
</item>
<item id="327" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="328">name</name>
<stringValue id="329">ICCREA_Price_Publishing_Consolidated</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="330" type="java.util.HashSet">
<item idref="278" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="331" type="java.util.HashSet">
<item id="332" type="com.j2fe.workflow.definition.Transition">
<name id="333">goto-next</name>
<source idref="280"/>
<target id="334">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="335">dump rsrc</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="336">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="337" type="java.util.HashSet">
<item id="338" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="339">["DoDeleteFile"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="340">input["DoDeleteFile"]</name>
<stringValue id="341">DoDelete</stringValue>
<type>VARIABLE</type>
</item>
<item id="342" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="343">["FileURI"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="344">input["FileURI"]</name>
<stringValue id="345">File</stringValue>
<type>VARIABLE</type>
</item>
<item id="346" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="347">["UploadFolder"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="348">input["UploadFolder"]</name>
<stringValue id="349">UploadFolder</stringValue>
<type>VARIABLE</type>
</item>
<item id="350" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="351">name</name>
<stringValue id="352">DumpRSRC2File</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="353" type="java.util.HashSet">
<item idref="332" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="354" type="java.util.HashSet">
<item id="355" type="com.j2fe.workflow.definition.Transition">
<name id="356">goto-next</name>
<source idref="334"/>
<target id="357">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="358">notify success</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="359">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="360" type="java.util.HashSet">
<item id="361" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="362">["EmailId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="363">input["EmailId"]</name>
<stringValue id="364">manual-upload-success</stringValue>
<type>CONSTANT</type>
</item>
<item id="365" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="366">["File"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="367">input["File"]</name>
<stringValue id="368">File</stringValue>
<type>VARIABLE</type>
</item>
<item id="369" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="370">["UserEmail"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="371">input["UserEmail"]</name>
<stringValue id="372">userEmail</stringValue>
<type>VARIABLE</type>
</item>
<item id="373" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="374">name</name>
<stringValue id="375">EmailNotification</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="376" type="java.util.HashSet">
<item idref="355" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="377" type="java.util.HashSet">
<item id="378" type="com.j2fe.workflow.definition.Transition">
<name id="379">goto-next</name>
<source idref="357"/>
<target idref="8"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</target>
</item>
<item idref="38" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="18"/>
</item>
</sources>
<targets id="380" type="java.util.HashSet">
<item idref="16" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="8"/>
</item>
<item idref="237" type="com.j2fe.workflow.definition.Transition"/>
<item idref="170" type="com.j2fe.workflow.definition.Transition"/>
<item idref="378" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="381" type="java.util.HashSet">
<item idref="6" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
</sources>
<targets id="382" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="383">Custom</group>
<haltOnError>true</haltOnError>
<lastChangeUser id="384">user1</lastChangeUser>
<lastUpdate id="385">2022-05-27T15:02:29.000+0800</lastUpdate>
<name id="386">ManualBulkUploadPrices</name>
<optimize>true</optimize>
<parameter id="387" type="java.util.HashMap">
<entry>
<key id="388" type="java.lang.String">BulkSize</key>
<value id="389" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="390">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="391" type="java.lang.String">CurrentUser</key>
<value id="392" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="393">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="394">the current login user id</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="395" type="java.lang.String">DataSource</key>
<value id="396" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="397">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="398" type="java.lang.String">DoCleanup</key>
<value id="399" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="400">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="401" type="java.lang.String">DoDelete</key>
<value id="402" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="403">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="404" type="java.lang.String">DoFVH</key>
<value id="405" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="406">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="407" type="java.lang.String">DoValidations</key>
<value id="408" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="409">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="410" type="java.lang.String">File</key>
<value id="411" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="412">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="413" type="java.lang.String">MessageType</key>
<value id="414" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="415">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="416" type="java.lang.String">ParallelBranches</key>
<value id="417" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="418">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="419" type="java.lang.String">UploadFolder</key>
<value id="420" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="421">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
</parameter>
<permissions id="422" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>true</purgeAtEnd>
<retries>0</retries>
<startNode idref="139"/>
<status>RELEASED</status>
<variables id="423" type="java.util.HashMap">
<entry>
<key id="424" type="java.lang.String">BulkSize</key>
<value id="425" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="426">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="427" type="java.lang.String">CurrentUser</key>
<value id="428" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="429">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="430">the current login user id</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="431" type="java.lang.String">DataSource</key>
<value id="432" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="433">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="434" type="java.lang.String">MANUAL</value>
</value>
</entry>
<entry>
<key id="435" type="java.lang.String">DoCleanup</key>
<value id="436" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="437">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="438" type="java.lang.String">true</value>
</value>
</entry>
<entry>
<key id="439" type="java.lang.String">DoDelete</key>
<value id="440" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="441">java.lang.Boolean</className>
<clazz>java.lang.Boolean</clazz>
<persistent>false</persistent>
<value idref="132"/>
</value>
</entry>
<entry>
<key id="442" type="java.lang.String">DoFVH</key>
<value id="443" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="444">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="445" type="java.lang.String">true</value>
</value>
</entry>
<entry>
<key id="446" type="java.lang.String">DoValidations</key>
<value id="447" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="448">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="449" type="java.lang.String">true</value>
</value>
</entry>
<entry>
<key id="450" type="java.lang.String">File</key>
<value id="451" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="452">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
</value>
</entry>
<entry>
<key id="453" type="java.lang.String">FileLoadJobId</key>
<value id="454" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="455">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
</value>
</entry>
<entry>
<key id="456" type="java.lang.String">MessageType</key>
<value id="457" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="458">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
<value id="459" type="java.lang.String">ManualBulkUploadPrices</value>
</value>
</entry>
<entry>
<key id="460" type="java.lang.String">ParallelBranches</key>
<value id="461" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="462">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="463" type="java.lang.Integer">2</value>
</value>
</entry>
<entry>
<key id="464" type="java.lang.String">UploadFolder</key>
<value id="465" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="466">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
<value id="467" type="java.lang.String">/tmp/Manual</value>
</value>
</entry>
</variables>
<version>30</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
