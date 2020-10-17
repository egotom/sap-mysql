

export const getCookie=(cname)=>
{
  var name = cname + "=";
  var ca = document.cookie.split(';');
  for(var i=0; i<ca.length; i++) 
  {
    var c = ca[i].trim();
    if (c.indexOf(name)==0) return c.substring(name.length,c.length);
  }
  return "";
}


export const getCookies=()=>
{
  let ca = document.cookie.split(';')
  let ar=[];
  for(let i=0; i<ca.length; i++) 
  {
    let c = ca[i].trim().split('=');
    ar.push(c)
  }
  return new Map(ar)
}