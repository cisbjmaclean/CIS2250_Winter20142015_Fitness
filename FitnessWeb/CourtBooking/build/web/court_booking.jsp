<%-- 
    Document   : main
    Created on : Nov 13, 2013, 2:51:24 PM
    Author     : bjmaclean
--%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<%--

This jsp will provide the user with a table of date/courts to allow them to see what's available and 
to select a court if one is free.  A hyperlink is build on the court name to allow them to select it.  
They also have a button to return to the main form if they change their minds.

--%>

<html:form action="/main">
    <body>
                
            <h3>
                <bean:message key="label.choose.court.and.time" />
            </h3>    

            <div>
            <table>
                <tr>
                    <td>
                        <%--  These messages can be used to display either messages, warnings, or errors from your
    actions.  You'll notice that once a court is booked a message is put out as an 
    information message.  --%>


                        <logic:messagesPresent message="true">
                            <html:messages id="msg2" message="true" property="message1"><div class="infoMessageCheck" style="color: green"><bean:write name="msg2"/></div><br/></html:messages>				  		
                            <html:messages id="msg2" message="true" property="warn"><div class="warnExclaim"  style="color: yellow"><bean:write name="msg2"/></div><br/></html:messages>
                            <html:messages id="msg2" message="true" property="error"><div class="errorX"  style="color: red"><bean:write name="msg2"/></div><br/></html:messages>				  		
                        </logic:messagesPresent>
                        <div style="color:red">
                            <html:errors />
                        </div>
                    </td>
                </tr>

                <tr>
                    <logic:iterate name="CourtBookings" id="TheCourtBooking" scope ="request">

                        <logic:notEmpty name="TheCourtBooking" property="firstCourtName"></tr><tr></logic:notEmpty>
                            <td>
                            <logic:notEmpty name="TheCourtBooking" property="firstCourtName">
                                <bean:write name="TheCourtBooking" property="startTime"/> 
                            </logic:notEmpty>
                        </td>
                        <td>
                            <logic:empty name="TheCourtBooking" property="firstName">
                                <a href="GetCourtBookingDetails.do?bookingDate=<bean:write name="TheCourtBooking" property="bookingDate" filter="true" />
&startTime=<bean:write name="TheCourtBooking" property="startTime" filter="true"/>
&courtNumber=<bean:write name="TheCourtBooking" property="courtNumber"/>">
                                </logic:empty>
                                <bean:write name="TheCourtBooking" property="courtName"/>
                                <logic:empty name="TheCourtBooking" property="firstName">
                                </a>
                            </logic:empty>



                            <bean:write name="TheCourtBooking" property="firstName"/>
                            &nbsp;<bean:write name="TheCourtBooking" property="lastName"/>
                            &nbsp;<bean:write name="TheCourtBooking" property="notes"/>
                        </td>

                    </logic:iterate>
                </tr>
            </table>
            </div>

    </body>

</html:form>
