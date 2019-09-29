<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bondhs.aspx.cs" Inherits="WebApplication4.Bondhs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="Scripts/jquery-3.3.1.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $.fn.MessageBox = function (order) {
                //SortDivs.Align("time", order);
                //SortDivs.Align("appointment", order);
                SortDivs.Align("name", order);
            };
        });

         var SortDivs = {
            IsDirty: false,

            SortType : { "time": "time", "name": "name", "appointment": "appointment" }, 
            
            Align: function (type, order) {
                switch (type) {
                    case SortDivs.SortType.time:
                        SortDivs.TimeSort(order);
                        break;
                    case SortDivs.SortType.name:
                        SortDivs.NameSort(order);
                        break;
                    case SortDivs.SortType.appointment:
                        SortDivs.AppointmentSort(order);
                        break;
                    default:
                        SortDivs.TimeSort(order);
                        break;
                }
            },

            GetSeconds: function (time) {
                var hours = Number(time.match(/^(\d+)/)[1]);
                var minutes = Number(time.match(/:(\d+)/)[1]);
                var AMPM = time.match(/\s(.*)$/)[1];
                if (AMPM.toUpperCase() == "PM" && hours < 12) hours = hours + 12;
                if (AMPM.toUpperCase() == "AM" && hours == 12) hours = hours - 12;
                var sHours = hours.toString();
                var sMinutes = minutes.toString();
                if (hours < 10) sHours = "0" + sHours;
                if (minutes < 10) sMinutes = "0" + sMinutes;
                return sHours*60*60 + sMinutes*60;
            },

            NameSort: function (order) {
                    $('.appointment-table-content').sort(function (a, b) {
                    
                    var a2 = $.trim($(a).find('.patient-demographics-wrap').text()).split("\n")[0];
                    var b2 = $.trim($(b).find('.patient-demographics-wrap').text()).split("\n")[0];

                    return order === 'ASC' ? a2.localeCompare(b2) : b2.localeCompare(a2);
                }).appendTo('body');
            },

            TimeSort: function (order) {
                $('.appointment-table-content').sort(function (a, b) {
                    var a = SortDivs.GetSeconds($.trim($(a).find('.time-wrap').text()));
                    var b = SortDivs.GetSeconds($.trim($(b).find('.time-wrap').text()));                  

                    if (order == 'ASC'){
                        return a - b;
                    }
                    return b - a;
                }).appendTo('body');
            },

            AppointmentSort: function (order) {
                $('.appointment-table-content').sort(function (a, b) {
                   
                    var a2 = $.trim($(a).find('.appointment-details-wrap').text()).split("\n")[0];
                    var b2 = $.trim($(b).find('.appointment-details-wrap').text()).split("\n")[0];

                    return order === 'ASC' ? a2.localeCompare(b2) : b2.localeCompare(a2);
                }).appendTo('body');
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <input type="button" value="Time ASC" onclick="$(this).MessageBox('ASC');" />&nbsp&nbsp
        <input type="button" value="Time DESC" onclick="$(this).MessageBox('DESC');" />


        <div class="appointment-table-content">

            <div class="notes-wrap">

                <img class="hover-effect" src="img/notes-Off.png" alt="note off" data-toggle="tooltip" title="Click to Add Notes">
            </div>
            <p>Div 1</p>
            <div class="time-wrap">
                3:45 pm

            </div>

            <div class="patient-demographics-wrap">

                <img src="img/female107.png" alt="person" style="width: 76px;" class="float-left">

                <div class="float-left">

                    <span class="hover-effect" style="display: block; font-weight: 700;" data-toggle="modal" data-target="#patient-demographics-details-popup1"><span data-toggle="tooltip" title="View Patient Demographics Details">Alana Walter</span></span>

                    <span style="display: block;">Female, 27 Years</span>

                    <span style="display: block;">DOB : 01/01/1992</span>

                    <span style="display: block;">MRN : 123550</span>

                    <span style="display: block;">Patient ID :85275</span>

                </div>

            </div>

            <div class="appointment-details-wrap">

                <span class="hover-effect" style="display: block; font-weight: 700; color: #D4615C;">Asthma</span>

                <span style="display: block;" class="hover-effect">Andrew Rogers </span>

                <div>

                    <img class="hover-effect" src="img/Appointment_Open.png" alt="Appointment open" data-toggle="tooltip" title="Complete Patient Check-in" style="width: 30px;">

                    <span>Open</span>

                </div>

                <span data-toggle="modal" data-target="#notification-popup">
                    <img class="hover-effect" src="img/notification.png" alt="notification" data-toggle="tooltip" title="Click to view Notifications" style="margin-top: 15px;"></span>

            </div>

            <div class="check-in-wrap">

                <img class="hover-effect" src="img/Screening.png" alt="signed screening" data-toggle="tooltip" title="Click here to Complete Screening" style="width: 40px; margin-right: 40px; opacity: .6;">

                <span class="pre-reg-link" data-toggle="modal" data-target="#pre-reg-link-popup1">
                    <img class="hover-effect" src="img/DeviceCheckin.png" alt="Device Checkin" data-toggle="tooltip" title="Click here to Send the pre-reg link" style="opacity: .6;"></span>

                <div class="progress-bar">

                    <span>0%</span>

                </div>

            </div>

            <div class="eligibility-details-wrap">

                <div class="clearfix">

                    <div class="float-left status-active"></div>

                    <div class="float-left">

                        <span style="display: block; font-weight: 700; color: #22b14c">(P): Active Coverage</span>

                        <span style="display: block;">Balance : ($1,658.00)</span>

                        <span style="display: block;">Carrier Name : Blue Cross Blue Shield</span>

                        <span style="display: block;">Co-Insurance : --</span>

                        <span style="display: block;">Has Co-Insurance : --</span>

                    </div>

                </div>

                <div class="clearfix" style="padding-top: 10px;">

                    <div class="float-left status-inactive"></div>

                    <div class="float-left">

                        <span style="display: block; font-weight: 700; color: #fbae46;">(S): Not Verified. Check Eligibility</span>

                        <span style="display: block;">SecondaryCarrierName : --</span>

                    </div>

                </div>

            </div>

            <div class="payments-wrap">

                <span style="display: block;">Co-payment : $20.00</span>

                <span style="display: block;">Balance : ($1,658.00)</span>

                <span style="display: block;">Remaining Deductible : $200.00</span>

                <span style="display: block;">Remaining out of Pocket : $1,143.52</span>

                <span style="display: block;">(P)SlidingFee : --</span>

                <span style="display: block;">Paid Amount : $200.00
                    <img class="hover-effect" src="img/print.png" alt="print" style="height: 20px;" data-toggle="modal" data-target="#print-receipt-popup"></span>

            </div>

            <div class="actions-wrap">

                <div class="action-btn">
                    Eligibility & Benefits

                </div>

                <div class="action-btn">
                    Accept Payment

                </div>

                <div class="action-btn">
                    Account Statement

                </div>

            </div>

            <div class="forms-on-demand-wrap">

                <img class="hover-effect" src="img/onDemandForm.png" alt="form on demand" data-toggle="tooltip" title="Add Form On-Demand" style="width: 40px;">
            </div>

        </div>

        <div class="appointment-table-content">

            <div class="notes-wrap">

                <img class="hover-effect" src="img/notes-Off.png" alt="note off" data-toggle="tooltip" title="Click to Add Notes">
            </div>
            <p>Div 2</p>
            <div class="time-wrap">
                7:00 pm

            </div>

            <div class="patient-demographics-wrap">

                <img src="img/Male107.png" alt="person" style="width: 76px;" class="float-left">

                <div class="float-left">

                    <span class="hover-effect" style="display: block; font-weight: 700;" data-toggle="modal" data-target="#patient-demographics-details-popup"><span data-toggle="tooltip" title="View Patient Demographics Details">Mike Sanderson</span></span>

                    <span style="display: block;">Male, 46 Years</span>

                    <span style="display: block;">DOB : 12/21/1972</span>

                    <span style="display: block;">MRN : 123456</span>

                    <span style="display: block;">Patient ID :56075</span>

                </div>

            </div>

            <div class="appointment-details-wrap">

                <span class="hover-effect appointment-detail-link" style="display: block; font-weight: 700; color: #D4615C;">Asthma</span>

                <span style="display: block;" class="hover-effect">Andrew Rogers </span>

                <div>

                    <img class="hover-effect" src="img/Appointment_Open.png" alt="Appointment open" data-toggle="tooltip" title="Complete Patient Check-in" style="width: 30px;">

                    <span>Open</span>

                </div>

                <span data-toggle="modal" data-target="#notification-popup">
                    <img class="hover-effect" src="img/notification.png" alt="notification" data-toggle="tooltip" title="Click to view Notifications" style="margin-top: 15px;"></span>

            </div>

            <div class="check-in-wrap">

                <img class="hover-effect" src="img/Screening.png" alt="signed screening" data-toggle="tooltip" title="Click here to Complete Screening" style="width: 40px; margin-right: 40px; opacity: .6;">

                <span class="pre-reg-link" data-toggle="modal" data-target="#pre-reg-link-popup">
                    <img class="hover-effect" src="img/DeviceCheckin.png" alt="Device Checkin" data-toggle="tooltip" title="Click here to Send the pre-reg link" style="opacity: .6;"></span>

                <div class="progress-bar">

                    <span>0%</span>

                </div>

            </div>

            <div class="eligibility-details-wrap">

                <div class="clearfix">

                    <div class="float-left status-active"></div>

                    <div class="float-left">

                        <span style="display: block; font-weight: 700; color: #22b14c">(P): Active Coverage</span>

                        <span style="display: block;">Balance : ($1,658.00)</span>

                        <span style="display: block;">Carrier Name : Blue Cross Blue Shield</span>

                        <span style="display: block;">Co-Insurance : 10%</span>

                        <span style="display: block;">Has Co-Insurance : Yes</span>

                    </div>

                </div>

                <div class="clearfix" style="padding-top: 10px;">

                    <div class="float-left status-inactive"></div>

                    <div class="float-left">

                        <span style="display: block; font-weight: 700; color: #fbae46;">(S): Not Verified. Check Eligibility</span>

                        <span style="display: block;">SecondaryCarrierName : --</span>

                    </div>

                </div>

            </div>

            <div class="payments-wrap">

                <span style="display: block;">Co-payment : $20.00</span>

                <span style="display: block;">Balance : ($1,658.00)</span>

                <span style="display: block;">Remaining Deductible : $200.00</span>

                <span style="display: block;">Remaining out of Pocket : $1,143.52</span>

                <span style="display: block;">(P)SlidingFee : --</span>

                <span style="display: block;">Paid Amount : $200.00
                    <img class="hover-effect" src="img/print.png" alt="print" style="height: 20px;" data-toggle="modal" data-target="#print-receipt-popup"></span>

            </div>

            <div class="actions-wrap">

                <div class="action-btn eligibility-benefits-link">
                    Eligibility & Benefits

                </div>

                <div class="action-btn" data-toggle="modal" data-target="#accept-payment-popup">
                    Accept Payment

                </div>

                <div class="action-btn" data-toggle="modal" data-target="#no-account-statement-popup">
                    Account Statement

                </div>

            </div>

            <div class="forms-on-demand-wrap">

                <span data-toggle="modal" data-target="#form-on-demand-popup">
                    <img class="hover-effect" src="img/onDemandForm.png" alt="form on demand" data-toggle="tooltip" title="Add Form On-Demand" style="width: 40px;"></span>

            </div>

        </div>

        <div class="appointment-table-content" id="app-search-data">

            <div class="notes-wrap">

                <img class="hover-effect" src="img/notes-Off.png" alt="note off" data-toggle="tooltip" title="Click to Add Notes">
            </div>
            <p>Div 3</p>
            <div class="time-wrap">
                2:45 AM

                <img src="img/Notif_Info.png" alt="notification" style="display: none; width: 50px; margin-top: 10px;" data-container="body" data-toggle="popover" data-placement="right" data-content="Enrolled in Payment Plan 5 Months">
            </div>

            <div class="patient-demographics-wrap">

                <img src="img/Male107.png" alt="person" style="width: 76px;" class="float-left">

                <div class="float-left">

                    <span class="hover-effect" style="display: block; font-weight: 700;" data-toggle="modal" data-target="#patient-demographics-details-popup2"><span data-toggle="tooltip" title="View Patient Demographics Details">Mike Sanderson</span></span>

                    <span style="display: block;">Male, 46 Years</span>

                    <span style="display: block;">DOB : 12/21/1972</span>

                    <span style="display: block;">MRN : 123456</span>

                    <span style="display: block;">Patient ID : 56075</span>

                </div>

            </div>

            <div class="appointment-details-wrap">

                <span class="hover-effect appointment-detail-link2" style="display: block; font-weight: 700; color: #D4615C;">Asthma</span>

                <span style="display: block;" class="hover-effect">Andrew Rogers </span>

                <div>

                    <span class="ce2" data-toggle="modal" data-target="#reconciliation1-popup">
                        <img class="hover-effect" src="img/Appointment_Open.png" alt="Appointment Completed" data-toggle="tooltip" title="Complete Patient Check-in" style="width: 30px;"></span>

                    <span class="ce2">Open</span>

                    <span class="ce3" data-toggle="modal" data-target="#reconciliation-popup">
                        <img class="hover-effect" src="img/Appointment_Completed.png" alt="Appointment Completed" data-toggle="tooltip" title="Complete Patient Check-in" style="width: 30px;"></span>

                    <span class="ce3">Complete Via Kiosk</span>

                </div>

                <span data-toggle="modal" data-target="#notification-popup">
                    <img class="hover-effect" src="img/notification.png" alt="notification" data-toggle="tooltip" title="Click to view Notifications" style="margin-top: 15px;"></span>

            </div>

            <div class="check-in-wrap">

                <img class="hover-effect ce2" src="img/Screening.png" alt="signed screening" data-toggle="tooltip" title="Click here to Complete Screening" style="width: 40px; margin-right: 40px;">

                <img class="hover-effect ce3" src="img/SignedScreening.png" alt="signed screening" data-toggle="tooltip" title="Click here to Complete Screening" style="width: 40px; margin-right: 40px; opacity: .6;">

                <span class="pre-reg-link ce2" data-toggle="modal" data-target="#pre-reg-link2-popup">
                    <img class="hover-effect" src="img/DeviceCheckin.png" alt="Device Checkin" data-toggle="tooltip" title="Click here to Send the pre-reg link"></span>

                <span class="pre-reg-link ce3" data-toggle="modal" data-target="#pre-reg-link2-popup">
                    <img class="hover-effect" src="img/DeviceCheckin.png" alt="Device Checkin" data-toggle="tooltip" title="Click here to Send the pre-reg link" style="opacity: .6;"></span>

                <div class="progress-bar ce2" style="position: relative">

                    <span>0%</span>

                </div>

                <div class="progress-bar ce3" style="position: relative; background-color: #198D85;">

                    <span>100%</span>

                </div>

            </div>

            <div class="eligibility-details-wrap">

                <div class="clearfix" style="display: flex;">

                    <div class="float-left status-inactive ce0"></div>

                    <div class="float-left status-active ce1" style="display: none;"></div>

                    <div class="float-left">

                        <span class="ce0" style="display: block; font-weight: 700">(P): Not Verified. Check Eligibility</span>

                        <span class="ce1" style="display: none; font-weight: 700; color: #22b14c">(P): Active Coverage</span>

                        <span style="display: block;">Balance : <span>$6,950.00</span></span>

                        <span style="display: block;">Carrier Name : <span class="ce0">--</span><span class="ce1" style="display: none;">Blue Cross Blue Shield</span></span>

                        <span style="display: block;">Co-Insurance : <span class="ce0">--</span><span class="ce1" style="display: none;">0%</span></span>

                        <span style="display: block;">Has Co-Insurance : <span class="ce0">--</span><span class="ce1" style="display: none;">No</span></span>

                    </div>

                </div>

                <div class="clearfix" style="padding-top: 10px; display: flex;">

                    <div class="float-left status-inactive"></div>

                    <div class="float-left">

                        <span style="display: block; font-weight: 700;">(S): Not Verified. Check Eligibility</span>

                        <span style="display: block;">SecondaryCarrierName : <span>--</span><span style="display: none;">Aetna Life & Casualty</span></span>

                    </div>

                </div>

            </div>

            <div class="payments-wrap">

                <span style="display: block;">Co-payment : <span class="ce0">--</span><span class="ce1" style="display: none;">$20.00</span></span>

                <span style="display: block;">Balance : <span>$6,950.00</span></span>

                <span style="display: block;">Remaining Deductible : <span class="ce0">--</span><span class="ce1" style="display: none;">$200.00</span></span>

                <span style="display: block;">Remaining out of Pocket : <span class="ce0">--</span><span class="ce1" style="display: none;">$1,143.52</span></span>

                <span style="display: block;">(P)SlidingFee : --</span>

                <span style="display: block;">Paid Amount : <span class="ce4">--</span><span class="ce5" style="display: none;">$895.00</span>
                    <img class="hover-effect ce5" src="img/print.png" alt="print" style="display: none; height: 20px;" data-toggle="modal" data-target="#print-receipt-popup2"></span>

            </div>

            <div class="actions-wrap">

                <div class="action-btn eligibility-benefits-link1 ce0">
                    Check Eligibility

                </div>

                <div class="action-btn eligibility-benefits-link2 ceb1" style="display: none;">
                    Eligibility & Benefits

                </div>

                <div class="action-btn" data-toggle="modal" data-target="#accept-payment1-popup">
                    Accept Payment

                </div>

                <div class="action-btn" data-toggle="modal" data-target="#no-account-statement-popup">
                    Account Statement

                </div>

            </div>

            <div class="forms-on-demand-wrap">

                <span data-toggle="modal" data-target="#form-on-demand-popup">
                    <img class="hover-effect" src="img/onDemandForm.png" alt="form on demand" data-toggle="tooltip" title="Add Form On-Demand" style="width: 40px;"></span>

            </div>

        </div>

    </form>
</body>
</html>
