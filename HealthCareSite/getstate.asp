<%
response.expires=-1
dim a(49)
'Fill up array with names
a(1)="Alabama"
a(2)="Alaska"
a(3)="Arizon"
a(4)="Arkansas"
a(5)="California"
a(6)="Colorado"
a(7)="Connecticut"
a(8)="Deleware"
a(9)="Florida"
a(10)="Georgia"
a(11)="Hawaii"
a(12)="Idaho"
a(13)="Illinois"
a(14)="Indiana"
a(15)="Iowa"
a(16)="Kansas"
a(17)="Kentucky"
a(18)="Louisiana"
a(19)="Maine"
a(20)="Maryland"
a(21)="Massachusetts"
a(22)="Michigan"
a(23)="Mississipi"
a(24)="Missouri"
a(25)="Montana"
a(26)="Nebraska"
a(27)="Nevada"
a(28)="New Hampshire"
a(29)="New Jersey"
a(30)="New Mexico"
a(31)="New York"
a(32)="North Carolina"
a(33)="North Dakota"
a(34)="Ohio"
a(35)="Oklahoma"
a(36)="Oregon"
a(37)="Pennsylvania"
a(38)="Rhode Island"
a(39)="South Carolina"
a(40)="South Dakota"
a(41)="Tenneseee"
a(42)="Texas"
a(43)="Utah"
a(44)="Vermont"
a(45)="Virginia"
a(46)="Washington"
a(47)="West Virgina"
a(48)="Wisconsin"
a(49)="Wyoming"

'get the q parameter from URL
q=ucase(request.querystring("q"))

'lookup all hints from array if length of q>0
if len(q)>0 then
  hint=""
  for i=1 to 49
    if q=ucase(mid(a(i),1,len(q))) then
      if hint="" then
        hint=a(i)
      else
        hint=hint & " , " & a(i)
      end if
    end if
  next
end if

'Output "no suggestion" if no hint were found
'or output the correct values
if hint="" then
  response.write("no suggestion")
else
  response.write(hint)
end if
%>