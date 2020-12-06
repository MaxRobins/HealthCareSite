<%
response.expires=-1
dim a(30)
'Fill up array with names
a(1)="shaquille_oatmeal"
a(2)="hangin_with_my_gnomies"
a(3)="hoosier-daddy"
a(4)="fast_and_the_curious"
a(5)="averagestudent"
a(6)="badkarma"
a(7)="google_was_my_idea"
a(8)="cute_as_duck"
a(9)="in_jail_out_soon"
a(10)="kiss_my_axe"
a(11)="ask_yo_girl_about_me"
a(12)="how_you_doing"
a(13)="james_bonde"
a(14)="julius_sneezer"
a(15)="hey_bud"
a(16)="hey_you"
a(17)="mynameis"
a(18)="hello"
a(19)="Doris"
a(20)="Eve"
a(21)="Evita"
a(22)="Sunniva"
a(23)="Tove"
a(24)="Unni"
a(25)="Violet"
a(26)="Liza"
a(27)="Elizabeth"
a(28)="Ellen"
a(29)="Wenche"
a(30)="Vicky"

'get the q parameter from URL
q=ucase(request.querystring("q"))

'lookup all hints from array if length of q>0
if len(q)>0 then
  hint=""
  for i=1 to 30
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