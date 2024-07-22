import "package:cloud_firestore/cloud_firestore.dart";

create(String reg,email,name,dir,grp,bat,fname,lname,gender,mobile,batchs,batche,fatname,fatnum,fatocc,motname,motnum,motocc,add,blood,aadhar,comm,colege,deg,dept,bank,branch,ifsc,DOB) async{



  await FirebaseFirestore.instance.collection('CADETS').doc(reg).set({'Regimental_number':reg,'Email':email,'name':name,'Directorate':dir,'Group':grp,'Battalion':bat,'FirstName':fname,'LasName':lname,'Gender':gender,'Mobile':mobile,'BatchFrom':batchs,'BatchTo':batche,'Fathers Name':fatname,'Father Number':fatnum,'Father Occupation':fatocc,'Mother Name':motname,'Mother Number ':motnum,'Mother Occupation':motocc,'Address':add,'Blood Group':blood,'Aadhar Number':aadhar,'Community':comm,'College':colege,'Degree':deg,'Department':dept,'Bank Account Number':bank,'Bank Branch':branch,'Ifsc':ifsc,'DOB':DOB});

  print('data created');

}

update(String collname,docname,field,var newfield) async{

  await FirebaseFirestore.instance.collection(collname).doc(docname).update({field:newfield});

  print('data updated');

}

delete(String collname,docname) async {

  await FirebaseFirestore.instance.collection(collname).doc(docname).delete();

  print('document deleted');
}


