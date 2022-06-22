<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="8.7.1.65">
<package-comment/>
<businessobject displayString="ICCREA-Bloomberg" type="com.j2fe.processing.BusinessFeed">
<com.j2fe.processing.BusinessFeed id="0">
<dataSource id="1">
<businessFeeds id="2" type="java.util.HashSet">
<item idref="0" type="com.j2fe.processing.BusinessFeed"/>
</businessFeeds>
<id id="3">ICCREA</id>
</dataSource>
<description id="4">ICCREA-Bloomberg</description>
<feedDefinition id="5">db://resource/xml/feeds/ICCREA/getdata.xml</feedDefinition>
<fileDefinitions id="6" type="java.util.ArrayList">
<item id="7" type="com.j2fe.processing.FileDefinition">
<file id="8">equity_euro.px.gz.enc*</file>
<group id="9">0</group>
<messageType id="10">
<applicationName id="11">CUSTOMERANDCTPTY</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd id="12">false</createMarketRealTimeInd>
<dataLineageEnabled>false</dataLineageEnabled>
<isKeyStreaming>false</isKeyStreaming>
<isVDDB>true</isVDDB>
<mappingResource id="13">db://resource/mapping/ICCREA/INBOUND/BBIccreaGlobalEquityPricing.mdx</mappingResource>
<metaData id="14" type="java.util.HashMap">
<entry>
<key id="15" type="java.lang.String">DescriptiveData</key>
<value id="16" type="java.lang.String">Y</value>
</entry>
<entry>
<key id="17" type="java.lang.String">PPED_OID</key>
<value id="18" type="java.lang.String">DAILY_1700</value>
</entry>
<entry>
<key id="19" type="java.lang.String">PriceData</key>
<value id="20" type="java.lang.String">Y</value>
</entry>
</metaData>
<name id="21">BBIccreaGlobalEquityPricing</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="22" type="java.util.ArrayList"/>
<publishingEvents id="23" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="24">
<filterVDDBNotifications>false</filterVDDBNotifications>
<inputMessageSaveOnly>false</inputMessageSaveOnly>
<saveInputMessage>ERROR</saveInputMessage>
<saveLowLevelNotificationsOnlyForErrors>false</saveLowLevelNotificationsOnlyForErrors>
<saveNotifications>WARNING</saveNotifications>
<saveProcessedMessage>ERROR</saveProcessedMessage>
<saveTranslatedMessage>ERROR</saveTranslatedMessage>
<saveUnprocessedInputMessage>false</saveUnprocessedInputMessage>
</streetLamp>
<syncPublishing>false</syncPublishing>
</messageType>
</item>
<item id="25" type="com.j2fe.processing.FileDefinition">
<file id="26">equity_namr.px.gz.enc*</file>
<group idref="9"/>
<messageType idref="10"/>
</item>
<item id="27" type="com.j2fe.processing.FileDefinition">
<file id="28">PRAZF0208000.OUT*</file>
<group idref="9"/>
<messageType id="29">
<applicationName id="30">CUSTOMERANDCTPTY</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd idref="12"/>
<dataLineageEnabled>false</dataLineageEnabled>
<isKeyStreaming>false</isKeyStreaming>
<isVDDB>true</isVDDB>
<mappingResource id="31">db://resource/mapping/ICCREA/INBOUND/BBIccreaGlobalEquityPricingPRAZ.mdx</mappingResource>
<metaData id="32" type="java.util.HashMap">
<entry>
<key id="33" type="java.lang.String">DescriptiveData</key>
<value id="34" type="java.lang.String">Y</value>
</entry>
<entry>
<key id="35" type="java.lang.String">PPED_OID</key>
<value id="36" type="java.lang.String">DAILY_1700</value>
</entry>
<entry>
<key id="37" type="java.lang.String">PriceData</key>
<value id="38" type="java.lang.String">Y</value>
</entry>
</metaData>
<name id="39">BBIccreaGlobalEquityPricingPRAZ</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="40" type="java.util.ArrayList"/>
<publishingEvents id="41" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="42">
<filterVDDBNotifications>false</filterVDDBNotifications>
<inputMessageSaveOnly>false</inputMessageSaveOnly>
<saveInputMessage>ERROR</saveInputMessage>
<saveLowLevelNotificationsOnlyForErrors>false</saveLowLevelNotificationsOnlyForErrors>
<saveNotifications>WARNING</saveNotifications>
<saveProcessedMessage>ERROR</saveProcessedMessage>
<saveTranslatedMessage>ERROR</saveTranslatedMessage>
<saveUnprocessedInputMessage>false</saveUnprocessedInputMessage>
</streetLamp>
<syncPublishing>false</syncPublishing>
</messageType>
</item>
<item id="43" type="com.j2fe.processing.FileDefinition">
<file id="44">PRAZF0108000.OUT*</file>
<group idref="9"/>
<messageType idref="29"/>
</item>
<item id="45" type="com.j2fe.processing.FileDefinition">
<file id="46">equity_fund_asia1.px.gz.enc*</file>
<group idref="9"/>
<messageType id="47">
<applicationName id="48">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>true</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd idref="12"/>
<dataLineageEnabled>false</dataLineageEnabled>
<isKeyStreaming>true</isKeyStreaming>
<isVDDB>true</isVDDB>
<mappingResource id="49">db://resource/mapping/ICCREA/INBOUND/BBIccreaGlobalMutualFundPricing.mdx</mappingResource>
<metaData id="50" type="java.util.HashMap">
<entry>
<key id="51" type="java.lang.String">DescriptiveData</key>
<value id="52" type="java.lang.String">Y</value>
</entry>
<entry>
<key id="53" type="java.lang.String">PPED_OID</key>
<value id="54" type="java.lang.String">DAILY_1700</value>
</entry>
<entry>
<key id="55" type="java.lang.String">PriceData</key>
<value id="56" type="java.lang.String">Y</value>
</entry>
</metaData>
<name id="57">BBIccreaGlobalMutualFundPricing</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="58" type="java.util.ArrayList"/>
<publishingEvents id="59" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="60">
<filterVDDBNotifications>false</filterVDDBNotifications>
<inputMessageSaveOnly>false</inputMessageSaveOnly>
<saveInputMessage>ERROR</saveInputMessage>
<saveLowLevelNotificationsOnlyForErrors>false</saveLowLevelNotificationsOnlyForErrors>
<saveNotifications>WARNING</saveNotifications>
<saveProcessedMessage>ERROR</saveProcessedMessage>
<saveTranslatedMessage>ERROR</saveTranslatedMessage>
<saveUnprocessedInputMessage>false</saveUnprocessedInputMessage>
</streetLamp>
<syncPublishing>false</syncPublishing>
</messageType>
</item>
<item id="61" type="com.j2fe.processing.FileDefinition">
<file id="62">equity_fund_euro.px.gz.enc*</file>
<group idref="9"/>
<messageType idref="47"/>
</item>
<item id="63" type="com.j2fe.processing.FileDefinition">
<file id="64">equity_fund_asia2.px.gz.enc*</file>
<group idref="9"/>
<messageType idref="47"/>
</item>
<item id="65" type="com.j2fe.processing.FileDefinition">
<file id="66">equity_fund_lamr.px.gz.enc*</file>
<group idref="9"/>
<messageType idref="47"/>
</item>
<item id="67" type="com.j2fe.processing.FileDefinition">
<file id="68">pfd_exch_euro.px.gz.enc*</file>
<group idref="9"/>
<messageType id="69">
<applicationName id="70">SECURITIESANDPROD</applicationName>
<businessEntity>false</businessEntity>
<businessFeed idref="0"/>
<caputureProcessMessage>false</caputureProcessMessage>
<commitMode>None</commitMode>
<createMarketRealTimeInd idref="12"/>
<dataLineageEnabled>false</dataLineageEnabled>
<isKeyStreaming>false</isKeyStreaming>
<isVDDB>true</isVDDB>
<mappingResource id="71">db://resource/mapping/ICCREA/INBOUND/BBIccreaPreferredExchangePricing.mdx</mappingResource>
<metaData id="72" type="java.util.HashMap">
<entry>
<key id="73" type="java.lang.String">DescriptiveData</key>
<value id="74" type="java.lang.String">Y</value>
</entry>
<entry>
<key id="75" type="java.lang.String">PPED_OID</key>
<value id="76" type="java.lang.String">DAILY_1700</value>
</entry>
<entry>
<key id="77" type="java.lang.String">PriceData</key>
<value id="78" type="java.lang.String">Y</value>
</entry>
</metaData>
<name id="79">BBIccreaPreferredExchangePricing</name>
<nearRealtimePublishing>false</nearRealtimePublishing>
<nearRealtimePublishingEvents id="80" type="java.util.ArrayList"/>
<publishingEvents id="81" type="java.util.ArrayList"/>
<rollbackOnError>false</rollbackOnError>
<saveVendorDataType>None</saveVendorDataType>
<streetLamp id="82">
<filterVDDBNotifications>false</filterVDDBNotifications>
<inputMessageSaveOnly>false</inputMessageSaveOnly>
<saveInputMessage>ERROR</saveInputMessage>
<saveLowLevelNotificationsOnlyForErrors>false</saveLowLevelNotificationsOnlyForErrors>
<saveNotifications>WARNING</saveNotifications>
<saveProcessedMessage>ERROR</saveProcessedMessage>
<saveTranslatedMessage>ERROR</saveTranslatedMessage>
<saveUnprocessedInputMessage>false</saveUnprocessedInputMessage>
</streetLamp>
<syncPublishing>false</syncPublishing>
</messageType>
</item>
<item id="83" type="com.j2fe.processing.FileDefinition">
<file id="84">pfd_exch_namr.px.gz.enc*</file>
<group idref="9"/>
<messageType idref="69"/>
</item>
<item id="85" type="com.j2fe.processing.FileDefinition">
<file id="86">equity_fund_namr.px.gz.enc*</file>
<group idref="9"/>
<messageType idref="47"/>
</item>
</fileDefinitions>
<grouping>false</grouping>
<messageTypes id="87" type="java.util.HashSet">
<item idref="47" type="com.j2fe.processing.MessageType"/>
<item idref="69" type="com.j2fe.processing.MessageType"/>
<item idref="10" type="com.j2fe.processing.MessageType"/>
<item idref="29" type="com.j2fe.processing.MessageType"/>
</messageTypes>
<name id="88">ICCREA-Bloomberg</name>
</com.j2fe.processing.BusinessFeed>
</businessobject>
</goldensource-package>
