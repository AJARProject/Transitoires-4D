//%attributes = {"shared":true}
  // __UNIT_TEST
  // Historical expected values of days_nextyear.

#DECLARE()

UT_assert("no arguments"; 0; days_nextyear)
UT_assert("Start and End the same year"; 0; days_nextyear(2019; !2019-10-01!; !2019-10-30!))
UT_assert("Start the current year and end the next year"; 304; days_nextyear(2019; !2019-10-01!; !2020-10-30!))
UT_assert("Start the previous year and end the next year"; 304; days_nextyear(2019; !2018-10-01!; !2020-10-30!))
UT_assert("Start the previous year and end the current year"; 0; days_nextyear(2019; !2018-10-01!; !2019-10-30!))
UT_assert("Start the previous year and end the previous year"; 0; days_nextyear(2019; !2018-10-01!; !2018-10-30!))
UT_assert("Start the next year and end the next year"; 30; days_nextyear(2019; !2020-10-01!; !2020-10-30!))
UT_assert("Start the next year and end the current year"; 0; days_nextyear(2019; !2020-10-01!; !2019-10-30!))
UT_assert("Start the next year and end the previous year"; 0; days_nextyear(2019; !2020-10-01!; !2018-10-30!))
