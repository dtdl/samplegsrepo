<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="8.7.1.79">
<package-comment/>
<businessobject displayString="21 - v7 20220519 job config" type="com.j2fe.workflow.definition.Workflow">
<com.j2fe.workflow.definition.Workflow id="0">
<alwaysPersist>false</alwaysPersist>
<clustered>true</clustered>
<comment id="1">v7 20220519 job config</comment>
<endNode id="2">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="3">Stop</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="4">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="5" type="java.util.HashSet">
<item id="6" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="7">statements</name>
<stringValue id="8">import org.apache.log4j.Logger;

Logger logger=Logger.getLogger("PriceValidationWrapper");
	
logger.info("Stopped")</stringValue>
<type>CONSTANT</type>
</item>
<item id="9" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="10">["previousDate"]@java/util/Date@</UITypeHint>
<input>false</input>
<name id="11">variables["previousDate"]</name>
<stringValue id="12">Processing Date</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="13" type="java.util.HashSet">
<item id="14" type="com.j2fe.workflow.definition.Transition">
<name id="15">goto-next</name>
<source id="16">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="17">Close Job</name>
<nodeHandler>com.j2fe.streetlamp.activities.CloseJob</nodeHandler>
<nodeHandlerClass id="18">com.j2fe.streetlamp.activities.CloseJob</nodeHandlerClass>
<parameters id="19" type="java.util.HashSet">
<item id="20" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="21">jobId</name>
<stringValue id="22">JobID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="23" type="java.util.HashSet">
<item id="24" type="com.j2fe.workflow.definition.Transition">
<name id="25">goto-next</name>
<source id="26">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="27">Fair Value Calculation</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="28">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="29" type="java.util.HashSet">
<item id="30" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="31">database</name>
<stringValue id="32">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="33" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="34">querySQL</name>
<stringValue id="35">ISCVFairValueQry</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="36" type="java.util.HashSet">
<item id="37" type="com.j2fe.workflow.definition.Transition">
<name id="38">goto-next</name>
<source id="39">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="40">Equity GPCS Procedure</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="41">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="42" type="java.util.HashSet">
<item id="43" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="44">database</name>
<stringValue id="45">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="46" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="47">indexedParameters[0]</name>
<stringValue id="48">ProcessedDate</stringValue>
<type>VARIABLE</type>
</item>
<item id="49" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="50">querySQL</name>
<stringValue id="51">BEGIN&#13;
   fT_p_equity(TO_DATE(?, 'DD/MM/YYYY'),null);&#13;
END;&#13;
</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="52" type="java.util.HashSet">
<item id="53" type="com.j2fe.workflow.definition.Transition">
<name id="54">goto-next</name>
<source id="55">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="56">Funds &amp; ETP GPCS Procedure</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="57">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="58" type="java.util.HashSet">
<item id="59" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="60">database</name>
<stringValue id="61">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="62" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="63">indexedParameters[0]</name>
<stringValue id="64">ProcessedDate</stringValue>
<type>VARIABLE</type>
</item>
<item id="65" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="66">querySQL</name>
<stringValue id="67">BEGIN&#13;
   FT_P_FUNDS_ETP(TO_DATE(?, 'DD/MM/YYYY'),null);&#13;
END;</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="68" type="java.util.HashSet">
<item id="69" type="com.j2fe.workflow.definition.Transition">
<name id="70">goto-next</name>
<source id="71">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="72">Calculate Dates for FVH</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="73">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="74" type="java.util.HashSet">
<item id="75" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="76">statements</name>
<stringValue id="77">import java.util.Calendar;
import java.util.Date;
import java.text.SimpleDateFormat;  
import org.apache.log4j.Logger;

Logger logger=Logger.getLogger("PriceValidationWrapper");

SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
String strDate = formatter.format(processingDate);  
int vCounter = 0;
logger.info("Date: " + strDate);</stringValue>
<type>CONSTANT</type>
</item>
<item id="78" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="79">["processingDate"]@java/util/Date@</UITypeHint>
<input>true</input>
<name id="80">variables["processingDate"]</name>
<stringValue id="81">Processing Date</stringValue>
<type>VARIABLE</type>
</item>
<item id="82" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="83">["strDate"]@java/lang/String@</UITypeHint>
<input>false</input>
<name id="84">variables["strDate"]</name>
<stringValue id="85">ProcessedDate</stringValue>
<type>VARIABLE</type>
</item>
<item id="86" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="87">variables["vCounter"]</name>
<stringValue id="88">loopCounter</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="89" type="java.util.HashSet">
<item id="90" type="com.j2fe.workflow.definition.Transition">
<name id="91">false</name>
<source id="92">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="93">Validations?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="94">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="95" type="java.util.HashSet">
<item id="96" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="97">caseItem</name>
<stringValue id="98">DoValidations</stringValue>
<type>VARIABLE</type>
</item>
<item id="99" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="100">defaultItem</name>
<stringValue id="101">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="102" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="103">nullTransition</name>
<stringValue id="104">true</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="105" type="java.util.HashSet">
<item id="106" type="com.j2fe.workflow.definition.Transition">
<name id="107">ToSplit</name>
<source id="108">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="109">Automatically generated</description>
<directJoin>false</directJoin>
<name id="110">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="111">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="112" type="java.util.HashSet">
<item id="113" type="com.j2fe.workflow.definition.Transition">
<name id="114">false</name>
<source id="115">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="116">Clean-up?</name>
<nodeHandler>com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandler>
<nodeHandlerClass id="117">com.j2fe.workflow.handler.impl.SwitchCaseSplit</nodeHandlerClass>
<parameters id="118" type="java.util.HashSet">
<item id="119" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="120">caseItem</name>
<stringValue id="121">DoCleanup</stringValue>
<type>VARIABLE</type>
</item>
<item id="122" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="123">defaultItem</name>
<stringValue id="124">false</stringValue>
<type>CONSTANT</type>
</item>
<item id="125" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="126">nullTransition</name>
<stringValue id="127">false</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="128" type="java.util.HashSet">
<item id="129" type="com.j2fe.workflow.definition.Transition">
<name id="130">goto-next</name>
<source id="131">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="132">Prepare EndDate Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="133">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="134" type="java.util.HashSet">
<item id="135" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="136">statements</name>
<objectValue id="137" type="java.lang.String">import java.util.Calendar;&#13;
import java.util.Date;&#13;
import java.text.SimpleDateFormat;&#13;
import com.google.common.base.Joiner;&#13;
import java.util.Arrays;&#13;
import java.util.List;&#13;
import org.apache.log4j.Logger;&#13;
&#13;
Logger logger=Logger.getLogger("AFS Price Validation Wrapper");&#13;
&#13;
SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");&#13;
String strProcessingDate = formatter.format(pProcessingDate);&#13;
&#13;
logger.info("strProcessingDate is: " + strProcessingDate );&#13;
List vListIssueGroupOID = null;&#13;
List vListInstrumentsOID = null;&#13;
String delim = "','";&#13;
String strIssueGroupOIDs = "";&#13;
String strInstrumentOIDs = "";&#13;
&#13;
if (pListInstrumentsOID instanceof String) {&#13;
	strInstrumentOIDs = "'"+ pListInstrumentsOID +"'";&#13;
} else {&#13;
	vListInstrumentsOID = Arrays.asList(pListInstrumentsOID);&#13;
	strInstrumentOIDs = "'" + Joiner.on(delim).join(vListInstrumentsOID) + "'";&#13;
}&#13;
&#13;
String vISPSEndDateQry =&#13;
"UPDATE ft_t_isps endt SET endt.end_tms = endt.start_tms, endt.last_chg_tms = sysdate, endt.last_chg_usr_id = 'ICR:MANUAL:CSTM:ENDDATE' " + &#13;
"WHERE (endt.end_tms IS NULL OR endt.end_tms &gt; sysdate) " + &#13;
"and endt.gpcs_oid in (SELECT gpcs.gpcs_oid FROM ft_t_gpcs gpcs, ft_o_isjb isjb where isjb.instr_id = gpcs.instr_id and gpcs.prc_tms = TO_DATE('" + strProcessingDate + "', 'DD-MM-YYYY') and isjb.job_id = '" + pJobId + "' and gpcs.end_tms is null) " + &#13;
"and endt.prc_tms  = TO_DATE('" + strProcessingDate + "', 'DD-MM-YYYY')";&#13;
&#13;
String vISCVDeleteQry =&#13;
"DELETE FROM ft_t_iscv endt WHERE endt.as_of_tms = TO_DATE('" + strProcessingDate + "', 'DD-MM-YYYY') " + &#13;
"and endt.gpcs_oid IN (SELECT gpcs.gpcs_oid FROM ft_t_gpcs gpcs, ft_o_isjb isjb where isjb.instr_id = gpcs.instr_id and gpcs.prc_tms = TO_DATE('" + strProcessingDate + "', 'DD-MM-YYYY') and isjb.job_id = '" + pJobId + "' and gpcs.end_tms is null) ";&#13;
&#13;
String vGPCSEndDateQry = &#13;
"UPDATE ft_t_gpcs endt SET endt.end_tms = endt.start_tms, endt.last_chg_tms = SYSDATE, endt.last_chg_usr_id = 'ICR:MANUAL:CSTM:ENDDATE' " + &#13;
"WHERE (endt.end_tms IS NULL OR endt.end_tms &gt; SYSDATE) " + &#13;
"and endt.instr_id in (select instr_id from ft_o_isjb where job_id = '" + pJobId + "') " + &#13;
"and endt.prc_tms  = TO_DATE('" + strProcessingDate + "', 'DD-MM-YYYY')";&#13;
&#13;
String vISCVFairValueQry = &#13;
"UPDATE Ft_t_ISCV ISCV SET ISCV.GOLDEN_VALUE_IND = 'Y',ISCV.LAST_CHG_TMS=SYSDATE, ISCV.LAST_CHG_USR_ID = 'ICR:MANUAL:CSTM:UPDATE', " + &#13;
"ISCV.GPCS_OID = (" + &#13;
"SELECT GPCS.GPCS_OID FROM Ft_T_GPCS GPCS WHERE GPCS.instr_id = ISCV.instr_id and GPCS.prc_curr_cde = ISCV.prc_curr_cde AND GPCS.DATA_SRC_ID = '" + pDataSrcId + "' " + &#13;
"AND GPCS.PRC_TMS = TO_DATE('" + strProcessingDate + "', 'DD-MM-YYYY') AND GPCS.GPRC_IND = 'Y' AND GPCS.END_TMS IS NULL) " + &#13;
"WHERE ISCV.AS_OF_TMS = TO_DATE('" + strProcessingDate + "', 'DD-MM-YYYY') AND ISCV.DATA_SRC_ID = '" + pDataSrcId + "' AND ISCV.LAST_CHG_USR_ID not in  ('ICR:CSTM:FT_P_COPYFWD_AFS' , 'GS:FVH:INSERT') and iscv.gpcs_oid is null " + &#13;
"and iscv.instr_id in (select instr_id from ft_o_isjb where job_id = '" + pJobId + "')";&#13;
&#13;
&#13;
logger.info ("vISPSEndDateQry: " + vISPSEndDateQry);&#13;
logger.info ("vISCVFairValueQry: " + vISCVFairValueQry);&#13;
logger.info ("vGPCSEndDateQry: " + vGPCSEndDateQry);&#13;
</objectValue>
<type>CONSTANT</type>
</item>
<item id="138" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="139">variables["pDataSrcId"]</name>
<stringValue id="140">DataSource</stringValue>
<type>VARIABLE</type>
</item>
<item id="141" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="142">variables["pJobId"]</name>
<stringValue id="143">JobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="144" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="145">variables["pListInstrumentsOID"]</name>
<stringValue id="146">ListInstrumentsOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="147" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="148">variables["pProcessingDate"]</name>
<stringValue id="149">Processing Date</stringValue>
<type>VARIABLE</type>
</item>
<item id="150" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="151">variables["vGPCSEndDateQry"]</name>
<stringValue id="152">GPCSEndDateQry</stringValue>
<type>VARIABLE</type>
</item>
<item id="153" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="154">variables["vISCVDeleteQry"]</name>
<stringValue id="155">ISCVDeleteQry</stringValue>
<type>VARIABLE</type>
</item>
<item id="156" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="157">variables["vISCVFairValueQry"]</name>
<stringValue id="158">ISCVFairValueQry</stringValue>
<type>VARIABLE</type>
</item>
<item id="159" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="160">variables["vISPSEndDateQry"]</name>
<stringValue id="161">ISPSEndDateQry</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="162" type="java.util.HashSet">
<item id="163" type="com.j2fe.workflow.definition.Transition">
<name id="164">rows-found</name>
<source id="165">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="166">ISJB Inserter Manually</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="167">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="168" type="java.util.HashSet">
<item id="169" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="170">database</name>
<stringValue id="171">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="172" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="173">[0]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="174">indexedParameters[0]</name>
<stringValue id="175">JobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="176" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="177">indexedParameters[1]</name>
<stringValue id="178">FileLoadJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="179" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="180">indexedParameters[2]</name>
<stringValue id="181">DataSource</stringValue>
<type>VARIABLE</type>
</item>
<item id="182" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="183">indexedParameters[3]</name>
<stringValue id="184">strProcessingDate</stringValue>
<type>VARIABLE</type>
</item>
<item id="185" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="186">querySQL</name>
<stringValue id="187">INSERT INTO FT_O_ISJB (SEQ_NUM,&#13;
                       JOB_ID,&#13;
                       INSTR_ID,&#13;
                       ISS_TYP,&#13;
                       LAST_CHG_TMS)&#13;
   SELECT ROWNUM,?,INSTR_ID,ISS_TYP,SYSDATE FROM (&#13;
        select distinct isid.instr_id, issu.iss_typ &#13;
        from ft_t_trid trid, ft_t_isid isid, ft_t_issu issu&#13;
        where job_id = ? &#13;
        and isid.instr_id = issu.instr_id&#13;
        and issu.end_tms is null&#13;
        and trid.main_entity_id = isid.iss_id&#13;
        and trid.main_entity_id_ctxt_typ = isid.id_ctxt_typ&#13;
        and isid.end_tms is null&#13;
        and trid.crrnt_severity_cde &lt; 50&#13;
        and exists (select 1 from ft_t_ispc where data_src_id = ? and prc_tms = to_date(?, 'DD-MM-YYYY'))&#13;
)</stringValue>
<type>CONSTANT</type>
</item>
<item id="188" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="189">rowCount</name>
<stringValue id="190">RowCount</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="191" type="java.util.HashSet">
<item id="192" type="com.j2fe.workflow.definition.Transition">
<name id="193">rows-found</name>
<source id="194">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="195">Fetch Instruments</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="196">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="197" type="java.util.HashSet">
<item id="198" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="199">database</name>
<stringValue id="200">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="201" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="202">firstColumnsResult</name>
<stringValue id="203">ListInstrumentsOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="204" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="205">querySQL</name>
<stringValue id="206">GetASFInstrumentsQry</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="207" type="java.util.HashSet">
<item id="208" type="com.j2fe.workflow.definition.Transition">
<name id="209">goto-next</name>
<source id="210">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="211">Prepare getInstrId Query</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="212">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="213" type="java.util.HashSet">
<item id="214" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="215">statements</name>
<objectValue id="216" type="java.lang.String">import java.util.Calendar;&#13;
import java.util.Date;&#13;
import java.text.SimpleDateFormat;&#13;
import com.google.common.base.Joiner;&#13;
import java.util.Arrays;&#13;
import java.util.List;&#13;
import org.apache.log4j.Logger;&#13;
&#13;
Logger logger=Logger.getLogger("AFS Price Validation Wrapper");&#13;
&#13;
SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");&#13;
String strProcessingDate = formatter.format(pProcessingDate);&#13;
&#13;
logger.info("strProcessingDate is: " + strProcessingDate );&#13;
&#13;
		String vGetASFInstrumentsQry =&#13;
		"select distinct isid.instr_id " +&#13;
		"from ft_t_trid trid, ft_t_isid isid " +&#13;
		"where job_id = '" + pFileLoadJobId + "' " +&#13;
		"and trid.main_entity_id = isid.iss_id " +&#13;
		"and trid.main_entity_id_ctxt_typ = isid.id_ctxt_typ " +&#13;
		"and isid.end_tms is null " +&#13;
		"and trid.crrnt_severity_cde &lt; 50 " +&#13;
		"and exists (select 1 from ft_t_ispc where data_src_id = '" + pDataSourceID + "' and prc_tms = to_date('" + strProcessingDate + "', 'DD-MM-YYYY')) "&#13;
		;&#13;
&#13;
logger.info ("vGetASFInstrumentsQry " + vGetASFInstrumentsQry);&#13;
</objectValue>
<type>CONSTANT</type>
</item>
<item id="217" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="218">variables["pDataSourceID"]</name>
<stringValue id="219">DataSource</stringValue>
<type>VARIABLE</type>
</item>
<item id="220" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="221">variables["pFileLoadJobId"]</name>
<stringValue id="222">FileLoadJobId</stringValue>
<type>VARIABLE</type>
</item>
<item id="223" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="224">variables["pProcessingDate"]</name>
<stringValue id="225">Processing Date</stringValue>
<type>VARIABLE</type>
</item>
<item id="226" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="227">variables["strProcessingDate"]</name>
<stringValue id="228">strProcessingDate</stringValue>
<type>VARIABLE</type>
</item>
<item id="229" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="230">variables["vGetASFInstrumentsQry"]</name>
<stringValue id="231">GetASFInstrumentsQry</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="232" type="java.util.HashSet">
<item id="233" type="com.j2fe.workflow.definition.Transition">
<name id="234">ToSplit</name>
<source id="235">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<description id="236">Automatically generated</description>
<directJoin>false</directJoin>
<name id="237">Merge</name>
<nodeHandler>com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandler>
<nodeHandlerClass id="238">com.j2fe.workflow.handler.impl.DummyActivityHandler</nodeHandlerClass>
<sources id="239" type="java.util.HashSet">
<item id="240" type="com.j2fe.workflow.definition.Transition">
<name id="241">false</name>
<source id="242">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="243">is Null ProcessingDate?</name>
<nodeHandler>com.j2fe.general.activities.IsNull</nodeHandler>
<nodeHandlerClass id="244">com.j2fe.general.activities.IsNull</nodeHandlerClass>
<parameters id="245" type="java.util.HashSet">
<item id="246" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="247">input</name>
<stringValue id="248">Processing Date</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="249" type="java.util.HashSet">
<item id="250" type="com.j2fe.workflow.definition.Transition">
<name id="251">goto-next</name>
<source id="252">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="253">Database Select (Standard)</name>
<nodeHandler>com.j2fe.general.activities.database.DBQuery</nodeHandler>
<nodeHandlerClass id="254">com.j2fe.general.activities.database.DBQuery</nodeHandlerClass>
<parameters id="255" type="java.util.HashSet">
<item id="256" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="257">database</name>
<stringValue id="258">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="259" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="260">[0]@java/util/Date@</UITypeHint>
<input>false</input>
<name id="261">firstColumnsResult[0]</name>
<stringValue id="262">Processing Date</stringValue>
<type>VARIABLE</type>
</item>
<item id="263" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="264">querySQL</name>
<stringValue id="265">select pub_date from FT_T_DTE1</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="266" type="java.util.HashSet">
<item id="267" type="com.j2fe.workflow.definition.Transition">
<name id="268">false</name>
<source id="269">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="270">FileLoadJobId null?</name>
<nodeHandler>com.j2fe.general.activities.IsNull</nodeHandler>
<nodeHandlerClass id="271">com.j2fe.general.activities.IsNull</nodeHandlerClass>
<parameters id="272" type="java.util.HashSet">
<item id="273" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="274">input</name>
<stringValue id="275">FileLoadJobId</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="276" type="java.util.HashSet">
<item id="277" type="com.j2fe.workflow.definition.Transition">
<name id="278">goto-next</name>
<source id="279">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="280">Create Job</name>
<nodeHandler>com.j2fe.streetlamp.activities.CreateJob</nodeHandler>
<nodeHandlerClass id="281">com.j2fe.streetlamp.activities.CreateJob</nodeHandlerClass>
<parameters id="282" type="java.util.HashSet">
<item id="283" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="284">configInfo</name>
<stringValue id="285">Manual Bulk Prices Validation</stringValue>
<type>CONSTANT</type>
</item>
<item id="286" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="287">file</name>
<objectValue id="288" type="java.net.URI">ManualBulkPricesValidation</objectValue>
<type>CONSTANT</type>
</item>
<item id="289" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="290">flushImmediate</name>
<objectValue id="291" type="java.lang.Boolean">true</objectValue>
<type>CONSTANT</type>
</item>
<item id="292" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="293">jobId</name>
<stringValue id="294">JobID</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="295" type="java.util.HashSet">
<item id="296" type="com.j2fe.workflow.definition.Transition">
<name id="297">goto-next</name>
<source id="298">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="299">Start</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="300">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="301" type="java.util.HashSet">
<item id="302" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="303">statements</name>
<stringValue id="304">import org.apache.log4j.Logger;

Logger logger=Logger.getLogger("PriceValidationWrapper");
	
logger.info("Started")</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="305" type="java.util.HashSet"/>
<targets id="306" type="java.util.HashSet">
<item idref="296" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>START</type>
</source>
<target idref="279"/>
</item>
</sources>
<targets id="307" type="java.util.HashSet">
<item idref="277" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="269"/>
</item>
</sources>
<targets id="308" type="java.util.HashSet">
<item idref="267" type="com.j2fe.workflow.definition.Transition"/>
<item id="309" type="com.j2fe.workflow.definition.Transition">
<name id="310">true</name>
<source idref="269"/>
<target idref="16"/>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="252"/>
</item>
</sources>
<targets id="311" type="java.util.HashSet">
<item idref="250" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="242"/>
</item>
</sources>
<targets id="312" type="java.util.HashSet">
<item idref="240" type="com.j2fe.workflow.definition.Transition"/>
<item id="313" type="com.j2fe.workflow.definition.Transition">
<name id="314">true</name>
<source idref="242"/>
<target id="315">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="316">Calculate Processing Date</name>
<nodeHandler>com.j2fe.general.activities.BeanShellScript</nodeHandler>
<nodeHandlerClass id="317">com.j2fe.general.activities.BeanShellScript</nodeHandlerClass>
<parameters id="318" type="java.util.HashSet">
<item id="319" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="320">statements</name>
<stringValue id="321">import java.util.Calendar;&#13;
import java.util.Date;&#13;
import java.text.SimpleDateFormat;&#13;
import org.apache.log4j.Logger;&#13;
&#13;
Logger logger=Logger.getLogger("PriceValidationWrapper");&#13;
	&#13;
Calendar calSysdate = Calendar.getInstance();&#13;
int month = calSysdate.get(Calendar.MONTH);&#13;
int year = calSysdate.get(Calendar.YEAR);&#13;
int date = calSysdate.get(Calendar.DATE);&#13;
calSysdate.set(year, month, date, 00, 00, 01);&#13;
calSysdate.add(Calendar.DAY_OF_YEAR, -1);&#13;
&#13;
Date previousDate = calSysdate.getTime();&#13;
&#13;
SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");&#13;
String strProcessingDate = formatter.format(previousDate);&#13;
&#13;
logger.info("strProcessingDate is: " + strProcessingDate + ", and previousDate is: " +previousDate );</stringValue>
<type>CONSTANT</type>
</item>
<item id="322" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="323">["previousDate"]@java/util/Date@</UITypeHint>
<input>false</input>
<name id="324">variables["previousDate"]</name>
<stringValue id="325">Processing Date</stringValue>
<type>VARIABLE</type>
</item>
<item id="326" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="327">["processingDate"]@java/util/Date@</UITypeHint>
<input>true</input>
<name id="328">variables["processingDate"]</name>
<stringValue id="329">Processing Date</stringValue>
<type>VARIABLE</type>
</item>
<item id="330" type="com.j2fe.workflow.definition.Parameter">
<input>false</input>
<name id="331">variables["strProcessingDate"]</name>
<stringValue id="332">strProcessingDate</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="333" type="java.util.HashSet">
<item idref="313" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="334" type="java.util.HashSet">
<item id="335" type="com.j2fe.workflow.definition.Transition">
<name id="336">goto-next</name>
<source idref="315"/>
<target idref="235"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="235"/>
</item>
<item idref="335" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="337" type="java.util.HashSet">
<item idref="233" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="210"/>
</item>
</sources>
<targets id="338" type="java.util.HashSet">
<item idref="208" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="194"/>
</item>
</sources>
<targets id="339" type="java.util.HashSet">
<item id="340" type="com.j2fe.workflow.definition.Transition">
<name id="341">nothing-found</name>
<source idref="194"/>
<target idref="16"/>
</item>
<item idref="192" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="165"/>
</item>
</sources>
<targets id="342" type="java.util.HashSet">
<item id="343" type="com.j2fe.workflow.definition.Transition">
<name id="344">nothing-found</name>
<source idref="165"/>
<target idref="16"/>
</item>
<item idref="163" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="131"/>
</item>
</sources>
<targets id="345" type="java.util.HashSet">
<item idref="129" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="115"/>
</item>
</sources>
<targets id="346" type="java.util.HashSet">
<item idref="113" type="com.j2fe.workflow.definition.Transition"/>
<item id="347" type="com.j2fe.workflow.definition.Transition">
<name id="348">true</name>
<source idref="115"/>
<target id="349">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="350">End Date ISPS</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="351">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="352" type="java.util.HashSet">
<item id="353" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="354">database</name>
<stringValue id="355">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="356" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="357">querySQL</name>
<stringValue id="358">ISPSEndDateQry</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="359" type="java.util.HashSet">
<item idref="347" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="360" type="java.util.HashSet">
<item id="361" type="com.j2fe.workflow.definition.Transition">
<name id="362">goto-next</name>
<source idref="349"/>
<target id="363">
<activation>TRANSACTIONAL</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="364">End Date GPCS</name>
<nodeHandler>com.j2fe.general.activities.database.DBStatement</nodeHandler>
<nodeHandlerClass id="365">com.j2fe.general.activities.database.DBStatement</nodeHandlerClass>
<parameters id="366" type="java.util.HashSet">
<item id="367" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="368">database</name>
<stringValue id="369">jdbc/GSDM-1</stringValue>
<type>REFERENCE</type>
</item>
<item id="370" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="371">querySQL</name>
<stringValue id="372">GPCSEndDateQry</stringValue>
<type>VARIABLE</type>
</item>
</parameters>
<sources id="373" type="java.util.HashSet">
<item idref="361" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="374" type="java.util.HashSet">
<item id="375" type="com.j2fe.workflow.definition.Transition">
<name id="376">goto-next</name>
<source idref="363"/>
<target idref="108"/>
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
</source>
<target idref="108"/>
</item>
<item idref="375" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="377" type="java.util.HashSet">
<item idref="106" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="92"/>
</item>
</sources>
<targets id="378" type="java.util.HashSet">
<item idref="90" type="com.j2fe.workflow.definition.Transition"/>
<item id="379" type="com.j2fe.workflow.definition.Transition">
<name id="380">true</name>
<source idref="92"/>
<target id="381">
<activation>INVOKE</activation>
<clusteredCall>false</clusteredCall>
<directJoin>false</directJoin>
<name id="382">Call PriceValidation</name>
<nodeHandler>com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandler>
<nodeHandlerClass id="383">com.j2fe.workflow.handler.impl.CallSubWorkflow</nodeHandlerClass>
<parameters id="384" type="java.util.HashSet">
<item id="385" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="386">["Bulk Size"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="387">input["Bulk Size"]</name>
<stringValue id="388">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="389" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="390">["BulkSize"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="391">input["BulkSize"]</name>
<stringValue id="392">BulkSize</stringValue>
<type>VARIABLE</type>
</item>
<item id="393" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="394">["Calculate MID price Options"]@com/j2fe/pricing/MIDCalculationOptions@</UITypeHint>
<input>true</input>
<name id="395">input["Calculate MID price Options"]</name>
<stringValue id="396">DoNotCalcMIDDoOnlyBasicChecks</stringValue>
<type>CONSTANT</type>
</item>
<item id="397" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="398">["CalculateMIDpriceOptions"]@com/j2fe/pricing/MIDCalculationOptions@</UITypeHint>
<input>true</input>
<name id="399">input["CalculateMIDpriceOptions"]</name>
<objectValue id="400" type="com.j2fe.pricing.MIDCalculationOptions">DoNotCalcMIDDoOnlyBasicChecks</objectValue>
<type>CONSTANT</type>
</item>
<item id="401" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="402">["Calendar"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="403">input["Calendar"]</name>
<stringValue id="404">PRPTUAL</stringValue>
<type>CONSTANT</type>
</item>
<item id="405" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="406">["CleanValidationInstructionCache"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="407">input["CleanValidationInstructionCache"]</name>
<stringValue id="408">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="409" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="410">["Consider Calendar Results"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="411">input["Consider Calendar Results"]</name>
<stringValue id="412">false</stringValue>
<type>CONSTANT</type>
</item>
<item id="413" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="414">["ConsiderCalendarResults"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="415">input["ConsiderCalendarResults"]</name>
<objectValue id="416" type="java.lang.Boolean">false</objectValue>
<type>CONSTANT</type>
</item>
<item id="417" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="418">["CreateIspsRecords"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="419">input["CreateIspsRecords"]</name>
<stringValue id="420">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="421" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="422">["Derive Golden Price"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="423">input["Derive Golden Price"]</name>
<stringValue id="424">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="425" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="426">["DeriveGoldenPrice"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="427">input["DeriveGoldenPrice"]</name>
<objectValue idref="291"/>
<type>CONSTANT</type>
</item>
<item id="428" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="429">["DiagnosticMode"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="430">input["DiagnosticMode"]</name>
<stringValue id="431">false</stringValue>
<type>CONSTANT</type>
</item>
<item id="432" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="433">["Do Price Derivation First"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="434">input["Do Price Derivation First"]</name>
<stringValue id="435">false</stringValue>
<type>CONSTANT</type>
</item>
<item id="436" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="437">["Donot Consider Issue Maturity"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="438">input["Donot Consider Issue Maturity"]</name>
<stringValue id="439">false</stringValue>
<type>CONSTANT</type>
</item>
<item id="440" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="441">["DonotConsiderIssueMaturity"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="442">input["DonotConsiderIssueMaturity"]</name>
<objectValue idref="416"/>
<type>CONSTANT</type>
</item>
<item id="443" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="444">["Downstream System Identifier"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="445">input["Downstream System Identifier"]</name>
<stringValue id="446">ICR_DWDF</stringValue>
<type>CONSTANT</type>
</item>
<item id="447" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="448">["DownstreamSystemIdentifier"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="449">input["DownstreamSystemIdentifier"]</name>
<stringValue id="450">ICR_DWDF</stringValue>
<type>CONSTANT</type>
</item>
<item id="451" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="452">["GoldenToleranceToDo"]@com/j2fe/pricing/ToleranceCases@</UITypeHint>
<input>true</input>
<name id="453">input["GoldenToleranceToDo"]</name>
<stringValue id="454">OnlySingleVendorCheck</stringValue>
<type>CONSTANT</type>
</item>
<item id="455" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="456">["Ignore Issue MAT_EXP_TMS"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="457">input["Ignore Issue MAT_EXP_TMS"]</name>
<stringValue id="458">false</stringValue>
<type>CONSTANT</type>
</item>
<item id="459" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="460">["IgnoreIssueMAT_EXP_TMS"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="461">input["IgnoreIssueMAT_EXP_TMS"]</name>
<objectValue idref="416"/>
<type>CONSTANT</type>
</item>
<item id="462" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="463">["IgnorePriceValidityForComparison"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="464">input["IgnorePriceValidityForComparison"]</name>
<stringValue id="465">false</stringValue>
<type>CONSTANT</type>
</item>
<item id="466" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="467">["Instruments"]@[Ljava/lang/String;@</UITypeHint>
<input>true</input>
<name id="468">input["Instruments"]</name>
<stringValue id="469">ListInstrumentsOid</stringValue>
<type>VARIABLE</type>
</item>
<item id="470" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="471">["LegLevelOption"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="472">input["LegLevelOption"]</name>
<stringValue id="473">false</stringValue>
<type>CONSTANT</type>
</item>
<item id="474" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="475">["Observation Period"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="476">input["Observation Period"]</name>
<stringValue id="477">8</stringValue>
<type>CONSTANT</type>
</item>
<item id="478" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="479">["ObservationPeriod"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="480">input["ObservationPeriod"]</name>
<objectValue id="481" type="java.lang.Integer">8</objectValue>
<type>CONSTANT</type>
</item>
<item id="482" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="483">["Overwrite Suspect Status"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="484">input["Overwrite Suspect Status"]</name>
<stringValue id="485">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="486" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="487">["OverwriteSuspectStatus"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="488">input["OverwriteSuspectStatus"]</name>
<objectValue idref="291"/>
<type>CONSTANT</type>
</item>
<item id="489" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="490">["PRVI Hierarchy Enable Switch"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="491">input["PRVI Hierarchy Enable Switch"]</name>
<stringValue id="492">false</stringValue>
<type>CONSTANT</type>
</item>
<item id="493" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="494">["PRVIHierarchyEnableSwitch"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="495">input["PRVIHierarchyEnableSwitch"]</name>
<objectValue idref="416"/>
<type>CONSTANT</type>
</item>
<item id="496" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="497">["Parent Job ID"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="498">input["Parent Job ID"]</name>
<stringValue id="499">JobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="500" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="501">["ParentJobID"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="502">input["ParentJobID"]</name>
<stringValue id="503">JobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="504" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="505">["Price Day Frequency"]@com/j2fe/pricing/PricingFrequency@</UITypeHint>
<input>true</input>
<name id="506">input["Price Day Frequency"]</name>
<stringValue id="507">daily</stringValue>
<type>CONSTANT</type>
</item>
<item id="508" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="509">["PriceDayFrequency"]@com/j2fe/pricing/PricingFrequency@</UITypeHint>
<input>true</input>
<name id="510">input["PriceDayFrequency"]</name>
<objectValue id="511" type="com.j2fe.pricing.PricingFrequency">daily</objectValue>
<type>CONSTANT</type>
</item>
<item id="512" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="513">["PricePointEventDefinitionId"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="514">input["PricePointEventDefinitionId"]</name>
<stringValue id="515">DAILY_1700</stringValue>
<type>CONSTANT</type>
</item>
<item id="516" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="517">["Processing Date"]@java/util/Date@</UITypeHint>
<input>true</input>
<name id="518">input["Processing Date"]</name>
<stringValue id="519">Processing Date</stringValue>
<type>VARIABLE</type>
</item>
<item id="520" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="521">["Processing Mode"]@com/j2fe/pricing/ProcessingMode@</UITypeHint>
<input>true</input>
<name id="522">input["Processing Mode"]</name>
<stringValue id="523">DoGoldenPriceCheckLast</stringValue>
<type>CONSTANT</type>
</item>
<item id="524" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="525">["ProcessingDate"]@java/util/Date@</UITypeHint>
<input>true</input>
<name id="526">input["ProcessingDate"]</name>
<stringValue id="527">Processing Date</stringValue>
<type>VARIABLE</type>
</item>
<item id="528" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="529">["ProcessingMode"]@com/j2fe/pricing/ProcessingMode@</UITypeHint>
<input>true</input>
<name id="530">input["ProcessingMode"]</name>
<objectValue id="531" type="com.j2fe.pricing.ProcessingMode">DoGoldenPriceCheckLast</objectValue>
<type>CONSTANT</type>
</item>
<item id="532" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="533">["Qualifying type for Golden Price Check"]@com/j2fe/pricing/QualifyPriceStatus@</UITypeHint>
<input>true</input>
<name id="534">input["Qualifying type for Golden Price Check"]</name>
<stringValue id="535">VALID</stringValue>
<type>CONSTANT</type>
</item>
<item id="536" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="537">["QualifyingtypeforGoldenPriceCheck"]@com/j2fe/pricing/QualifyPriceStatus@</UITypeHint>
<input>true</input>
<name id="538">input["QualifyingtypeforGoldenPriceCheck"]</name>
<objectValue id="539" type="com.j2fe.pricing.QualifyPriceStatus">VALID</objectValue>
<type>CONSTANT</type>
</item>
<item id="540" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="541">["ReUse Job Id"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="542">input["ReUse Job Id"]</name>
<objectValue idref="291"/>
<type>CONSTANT</type>
</item>
<item id="543" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="544">["ReUseJobId"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="545">input["ReUseJobId"]</name>
<objectValue idref="291"/>
<type>CONSTANT</type>
</item>
<item id="546" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="547">["RelType OneToMany"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="548">input["RelType OneToMany"]</name>
<stringValue id="549">ONETOMNY</stringValue>
<type>CONSTANT</type>
</item>
<item id="550" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="551">["RelType Sequence"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="552">input["RelType Sequence"]</name>
<stringValue id="553">SEQUENCE</stringValue>
<type>CONSTANT</type>
</item>
<item id="554" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="555">["Run Rescrub"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="556">input["Run Rescrub"]</name>
<stringValue id="557">false</stringValue>
<type>CONSTANT</type>
</item>
<item id="558" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="559">["RunRescrub"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="560">input["RunRescrub"]</name>
<objectValue idref="416"/>
<type>CONSTANT</type>
</item>
<item id="561" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="562">["Threads In Parallel"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="563">input["Threads In Parallel"]</name>
<stringValue id="564">ThreadsInParallel</stringValue>
<type>VARIABLE</type>
</item>
<item id="565" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="566">["ThreadsInParallel"]@java/lang/Integer@</UITypeHint>
<input>true</input>
<name id="567">input["ThreadsInParallel"]</name>
<stringValue id="568">ThreadsInParallel</stringValue>
<type>VARIABLE</type>
</item>
<item id="569" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="570">["ToleranceToDo"]@com/j2fe/pricing/ToleranceCases@</UITypeHint>
<input>true</input>
<name id="571">input["ToleranceToDo"]</name>
<stringValue id="572">OnlySingleVendorCheck</stringValue>
<type>CONSTANT</type>
</item>
<item id="573" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="574">["Working Job Id"]@java/lang/String@</UITypeHint>
<input>true</input>
<name id="575">input["Working Job Id"]</name>
<stringValue id="576">JobID</stringValue>
<type>VARIABLE</type>
</item>
<item id="577" type="com.j2fe.workflow.definition.Parameter">
<UITypeHint id="578">["WriteValidStatusRecords"]@java/lang/Boolean@</UITypeHint>
<input>true</input>
<name id="579">input["WriteValidStatusRecords"]</name>
<stringValue id="580">true</stringValue>
<type>CONSTANT</type>
</item>
<item id="581" type="com.j2fe.workflow.definition.Parameter">
<input>true</input>
<name id="582">name</name>
<stringValue id="583">Price Validation Consolidated</stringValue>
<type>CONSTANT</type>
</item>
</parameters>
<sources id="584" type="java.util.HashSet">
<item idref="379" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="585" type="java.util.HashSet">
<item id="586" type="com.j2fe.workflow.definition.Transition">
<name id="587">goto-next</name>
<source idref="381"/>
<target idref="71"/>
</item>
</targets>
<type>ACTIVITY</type>
</target>
</item>
</targets>
<type>XORSPLIT</type>
</source>
<target idref="71"/>
</item>
<item idref="586" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="588" type="java.util.HashSet">
<item idref="69" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="55"/>
</item>
</sources>
<targets id="589" type="java.util.HashSet">
<item idref="53" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="39"/>
</item>
</sources>
<targets id="590" type="java.util.HashSet">
<item idref="37" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="26"/>
</item>
</sources>
<targets id="591" type="java.util.HashSet">
<item idref="24" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="16"/>
</item>
<item idref="340" type="com.j2fe.workflow.definition.Transition"/>
<item idref="343" type="com.j2fe.workflow.definition.Transition"/>
<item idref="309" type="com.j2fe.workflow.definition.Transition"/>
</sources>
<targets id="592" type="java.util.HashSet">
<item idref="14" type="com.j2fe.workflow.definition.Transition"/>
</targets>
<type>ACTIVITY</type>
</source>
<target idref="2"/>
</item>
</sources>
<targets id="593" type="java.util.HashSet"/>
<type>END</type>
</endNode>
<forcePurgeAtEnd>false</forcePurgeAtEnd>
<group id="594">Custom</group>
<haltOnError>true</haltOnError>
<lastChangeUser id="595">user1</lastChangeUser>
<lastUpdate id="596">2022-05-19T12:29:02.000+0800</lastUpdate>
<name id="597">ManualBulkUploadReRunPVCWrapper</name>
<optimize>true</optimize>
<parameter id="598" type="java.util.HashMap">
<entry>
<key id="599" type="java.lang.String">BulkSize</key>
<value id="600" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="601">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="602" type="java.lang.String">DataSource</key>
<value id="603" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="604">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="605">DataSource of the price</description>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="606" type="java.lang.String">DoCleanup</key>
<value id="607" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="608">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="609">Valid values: true or false. Flag for performing cleanup(end-date) existing ISCV, ISPS and GPCS before validations.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="610" type="java.lang.String">DoFVH</key>
<value id="611" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="612">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="613">Valid values: true or false. Flag for performing FVH.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="614" type="java.lang.String">DoValidations</key>
<value id="615" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="616">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="617">Valid values: true or false. Flag for triggering validations.</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="618" type="java.lang.String">FileLoadJobId</key>
<value id="619" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="620">java.lang.String</className>
<clazz>java.lang.String</clazz>
<input>true</input>
<output>false</output>
<required>true</required>
</value>
</entry>
<entry>
<key id="621" type="java.lang.String">Processing Date</key>
<value id="622" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="623">java.util.Date</className>
<clazz>java.util.Date</clazz>
<description id="624">If left blank then previous day is picked by default</description>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
<entry>
<key id="625" type="java.lang.String">ThreadsInParallel</key>
<value id="626" type="com.j2fe.workflow.definition.WorkflowParameter">
<className id="627">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<input>true</input>
<output>false</output>
<required>false</required>
</value>
</entry>
</parameter>
<permissions id="628" type="java.util.HashSet"/>
<priority>50</priority>
<purgeAtEnd>false</purgeAtEnd>
<retries>0</retries>
<startNode idref="298"/>
<status>RELEASED</status>
<variables id="629" type="java.util.HashMap">
<entry>
<key id="630" type="java.lang.String">BulkSize</key>
<value id="631" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="632">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="633" type="java.lang.Integer">200</value>
</value>
</entry>
<entry>
<key id="634" type="java.lang.String">DataSource</key>
<value id="635" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="636">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="637">DataSource of the price</description>
<persistent>false</persistent>
<value id="638" type="java.lang.String">FINANZIARIE</value>
</value>
</entry>
<entry>
<key id="639" type="java.lang.String">DoCleanup</key>
<value id="640" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="641">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="642">Valid values: true or false. Flag for performing cleanup(end-date) existing ISCV, ISPS and GPCS before validations.</description>
<persistent>false</persistent>
<value id="643" type="java.lang.String">true</value>
</value>
</entry>
<entry>
<key id="644" type="java.lang.String">DoFVH</key>
<value id="645" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="646">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="647">Valid values: true or false. Flag for performing FVH.</description>
<persistent>false</persistent>
<value id="648" type="java.lang.String">true</value>
</value>
</entry>
<entry>
<key id="649" type="java.lang.String">DoValidations</key>
<value id="650" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="651">java.lang.String</className>
<clazz>java.lang.String</clazz>
<description id="652">Valid values: true or false. Flag for triggering validations.</description>
<persistent>false</persistent>
<value id="653" type="java.lang.String">true</value>
</value>
</entry>
<entry>
<key id="654" type="java.lang.String">FileLoadJobId</key>
<value id="655" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="656">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>true</persistent>
</value>
</entry>
<entry>
<key id="657" type="java.lang.String">ISCVFairValueQry</key>
<value id="658" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="659">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="660" type="java.lang.String">JobID</key>
<value id="661" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="662">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="663" type="java.lang.String">Processing Date</key>
<value id="664" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="665">java.util.Date</className>
<clazz>java.util.Date</clazz>
<description id="666">If left blank then previous day is picked by default</description>
<persistent>false</persistent>
</value>
</entry>
<entry>
<key id="667" type="java.lang.String">ThreadsInParallel</key>
<value id="668" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="669">java.lang.Integer</className>
<clazz>java.lang.Integer</clazz>
<persistent>false</persistent>
<value id="670" type="java.lang.Integer">7</value>
</value>
</entry>
<entry>
<key id="671" type="java.lang.String">strProcessingDate</key>
<value id="672" type="com.j2fe.workflow.definition.GlobalVariable">
<className id="673">java.lang.String</className>
<clazz>java.lang.String</clazz>
<persistent>false</persistent>
</value>
</entry>
</variables>
<version>21</version>
</com.j2fe.workflow.definition.Workflow>
</businessobject>
</goldensource-package>
