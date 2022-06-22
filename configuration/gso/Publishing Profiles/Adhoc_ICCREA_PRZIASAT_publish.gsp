<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<goldensource-package version="8.7.1.65">
<package-comment/>
<businessobject displayString="OnMessagePublishing" type="org.quartz.impl.JobDetailImpl">
<org.quartz.impl.JobDetailImpl id="0">
<group id="1">Events</group>
<jobClass>com.j2fe.scheduling.jobs.ExecuteEventJob</jobClass>
<jobDataMap id="2"/>
<name id="3">OnMessagePublishing</name>
</org.quartz.impl.JobDetailImpl>
</businessobject>
<businessobject displayString="Schedule_Adhoc_ICCREA_PRZIASAT_publish" type="org.quartz.impl.triggers.CronTriggerImpl">
<org.quartz.impl.triggers.CronTriggerImpl id="0">
<cronExpression id="1">0 0 0 1 1 ?</cronExpression>
<group id="2">Events</group>
<jobDataMap id="3">
<entry>
<key id="4" type="java.lang.String">Event:Database</key>
<value id="5" type="java.lang.String">jdbc/GSDM-1</value>
</entry>
<entry>
<key id="6" type="java.lang.String">Event:PublishingBulkSize</key>
<value id="7" type="java.lang.String">1000</value>
</entry>
<entry>
<key id="8" type="java.lang.String">Event:parallelBranches</key>
<value id="9" type="java.lang.String">1</value>
</entry>
<entry>
<key id="10" type="java.lang.String">Event:subscriptionId</key>
<value id="11" type="java.lang.String">++7jFtYmgk2KG00A</value>
</entry>
<entry>
<key id="12" type="java.lang.String">EventName</key>
<value id="13" type="java.lang.String">BulkSubscriptionPublishingEvent</value>
</entry>
<entry>
<key id="14" type="java.lang.String">PublishingBulkSize</key>
<value id="15" type="java.lang.String">500</value>
</entry>
<entry>
<key id="16" type="java.lang.String">publishingMode</key>
<value id="17" type="java.lang.String">BATCH</value>
</entry>
</jobDataMap>
<jobGroup id="18">Events</jobGroup>
<jobName id="19">OnMessagePublishing</jobName>
<misfireInstruction>0</misfireInstruction>
<name id="20">Schedule_Adhoc_ICCREA_PRZIASAT_publish</name>
<nextFireTime id="21">2021-01-01T00:00:00.000+0530</nextFireTime>
<priority>5</priority>
<startTime id="22">2020-05-22T18:40:25.000+0530</startTime>
<timeZone id="23">Asia/Calcutta</timeZone>
</org.quartz.impl.triggers.CronTriggerImpl>
</businessobject>
<businessobject displayString="Adhoc_ICCREA_PRZIASAT_publish" type="com.thegoldensource.subscription.configuration.Subscription">
<com.thegoldensource.subscription.configuration.Subscription id="0">
<dataSources id="1" type="java.util.HashSet"/>
<deliveryEvent id="2">PublishingWorkflow</deliveryEvent>
<description id="3">Adhoc_ICCREA_PRZIASAT_publish</description>
<downstreams id="4" type="java.util.HashSet">
<item id="5" type="com.thegoldensource.subscription.configuration.SubscriptionDownstream">
<downstreamDestination id="6">017jFsL0gk2KIq00</downstreamDestination>
<subscription idref="0"/>
<transientDownStreamDestination id="7">
<destinationType id="8">FILE</destinationType>
<destinationValue id="9">/gold/InputFiles/PublishedFiles/PRZIASAT</destinationValue>
<downstreamSystem id="10">
<description id="11">PRZIASAT_PUBLISHING</description>
<downStreamType id="12">Y</downStreamType>
<downstreamDestinations id="13" type="java.util.HashSet">
<item idref="7" type="com.thegoldensource.subscription.DownstreamDestination"/>
</downstreamDestinations>
<lastChangeUser id="14">user1</lastChangeUser>
<lastUpdate id="15">2020-05-22T10:17:37.000+0530</lastUpdate>
<name id="16">PRZIASAT_PUBLISHING</name>
<startTime id="17">2020-05-22T10:17:37.000+0530</startTime>
</downstreamSystem>
<id id="18">017jFsL0gk2KIq00</id>
<lastChangeUser id="19">user1</lastChangeUser>
<lastUpdate id="20">2020-05-22T10:17:16.000+0530</lastUpdate>
<preferredLanguage id="21">ENGLISH</preferredLanguage>
<preferredVendor id="22">ICCREA</preferredVendor>
<startTime id="23">2020-05-22T10:17:37.000+0530</startTime>
</transientDownStreamDestination>
<type id="24">XML</type>
</item>
</downstreams>
<filter id="25" type="java.util.HashSet">
<item id="26" type="com.thegoldensource.subscription.configuration.Filter">
<aoiIds id="27" type="java.util.HashSet"/>
<deltaMode>NONE</deltaMode>
<endTime id="28">2020-05-26T16:42:06.000+0530</endTime>
<entityType>BUSINESS_ENTITY</entityType>
<eql id="29">&lt;sql&gt; To_Date(igr1_prc_tms,’DD-MM-YYYY’) =To_Date((SELECT pub_Date FROM ft_T_dte1),'DD-MM-YYYY') and igr1_goldenprice is not null &lt;/sql&gt;</eql>
<gsoBusinessEntityId id="30">007hd5Ci2etZW02Z</gsoBusinessEntityId>
<id id="31">++7jFtYmgk2KG00C</id>
<lastChangeUser id="32">user1</lastChangeUser>
<lastUpdate id="33">2020-05-26T16:42:06.000+0530</lastUpdate>
<modelStartTms id="34">2020-05-22T18:39:33.000+0530</modelStartTms>
<outputFormat id="35" type="java.util.HashSet"/>
<startTime id="36">2020-05-22T18:39:33.000+0530</startTime>
<subscription idref="0"/>
<tableType id="37">IGR1</tableType>
</item>
<item id="38" type="com.thegoldensource.subscription.configuration.Filter">
<aoiIds id="39" type="java.util.HashSet"/>
<deltaMode>NONE</deltaMode>
<entityType>BUSINESS_ENTITY</entityType>
<eql id="40">&lt;sql&gt; To_Date(igr1_prc_tms,'DD-MM-YYYY') =To_Date((SELECT pub_Date FROM ft_T_dte1),'DD-MM-YYYY') and igr1_goldenprice is not null &lt;/sql&gt;</eql>
<gsoBusinessEntityId id="41">007hd5Ci2etZW02Z</gsoBusinessEntityId>
<id id="42">++7jcLRmgk2KG002</id>
<lastChangeUser id="43">user1</lastChangeUser>
<lastUpdate id="44">2020-05-26T16:42:09.000+0530</lastUpdate>
<modelStartTms id="45">2020-05-26T16:42:09.000+0530</modelStartTms>
<outputFormat id="46" type="java.util.HashSet">
<item id="47" type="com.thegoldensource.subscription.configuration.SubscriptionOutputFormat">
<filter idref="38"/>
<id id="48">++7jcLRmgk2KG003</id>
<resource id="49">
<id>db://resource/mapping/ICCREA/OUTBOUND/PRZIASAT.mdx</id>
<content binary="true" compressed="true" type="mdx"/>
</resource>
<resourceConfigType id="50">TRANSFORMATION</resourceConfigType>
<subscriptionDownstream idref="5"/>
</item>
</outputFormat>
<startTime id="51">2020-05-26T16:42:09.000+0530</startTime>
<subscription idref="0"/>
<tableType id="52">IGR1</tableType>
</item>
</filter>
<groups id="53" type="java.util.HashSet"/>
<lastChangeUser id="54">user1</lastChangeUser>
<lastUpdate id="55">2020-05-26T16:42:08.000+0530</lastUpdate>
<name id="56">Adhoc_ICCREA_PRZIASAT_publish</name>
<publishingMode>BATCH</publishingMode>
<startTime id="57">2020-05-22T18:38:24.000+0530</startTime>
</com.thegoldensource.subscription.configuration.Subscription>
</businessobject>
</goldensource-package>
