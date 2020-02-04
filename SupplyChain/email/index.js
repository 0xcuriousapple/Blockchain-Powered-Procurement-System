function sendEmail(email_id) {
  Email.send({
    Host : "smtp.elasticemail.com",
    Username : "abhivispute33@gmail.com",
    Password : "E570F9C7F661AF0197EDDF30B781CB32F974",
    To : email_id,
    From : "abhivispute33@gmail.com",
    Subject : "GAIL Tender",
    Body : "Congratulations, tender is alloted to you Item id: "
    // Host: "smtp.gmail.com",
    // Username : "abhivispute33@gmail.com",
    // Password : "",
    // To : 'abhivispute33@gmail.com',
    // From : "abhivispute33@gmail.com",
    // Subject : "<email subject>",
    // Body : "<email body>",
  })
  .then(function(message){
    alert("mail sent successfully")
  });
}

