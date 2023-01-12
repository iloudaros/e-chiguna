$(document).ready(function () {
  $(".alert").hide();

  $("#form_register").submit(function (event) {
    event.preventDefault();
    $.post("api.php?g=1", $("#form_register").serialize(), function (res) {
      //$("form").animate({height:'+=20px'});
      $("#alert" + res)
        .fadeIn(1200, "linear")
        .delay(600)
        .fadeOut(1200, "linear");
      //$("form").delay(2500).animate({height:'243px'});

      $("#form_register")[0].reset();
    });
  });

  $("#form_login").submit(function (event) {
    event.preventDefault();
    $.post("api.php?g=2", $("#form_login").serialize(), function (res) {
      if (res == 0) {
        $("#usrpwd").animate({ height: "+=80px" });
        $("form").animate({ marginTop: "-=20px", marginBottom: "-=20px" });
        $("#login_err")
          .fadeIn(1200, "linear")
          .delay(600)
          .fadeOut(1200, "linear");
        $("form")
          .delay(2500)
          .animate({ marginTop: "+=20px", marginBottom: "+=20px" });
        $("#usrpwd").delay(2500).animate({ height: "166px" });

        $("#usr").val("");
        $("#pwd").val("");
      } else {
        window.location.href = "user_home.html";
      }
    });
  });

  $("#logout").click(function () {
    $.get("api.php?g=3", function (res) {
      window.location.href = "login.html";
    });
  });

  $("#form_edit_profile").submit(function (event) {
    event.preventDefault();
    $.post("api.php?g=4", $("#form_edit_profile").serialize(), function (res) {
      $("#n_usrpwd").animate({ height: "+=80px" });
      $(".alert").fadeIn(1200, "linear").delay(600).fadeOut(1200, "linear");
      $("#n_usrpwd").delay(2500).animate({ height: "-=80px" });
    });
  });
});

function getusers() {
  $.get("api.php?g=5", function (res) {
    js = JSON.parse(res);
    h = "<table class=table>";
    h += "<tr><td>Username</td><td>Email</td><td>Admin=1</td></tr>";
    for (i = 0; i < js.length; i++) {
      h +=
        "<tr><td>" +
        js[i].username +
        "</td><td>" +
        js[i].email +
        "</td><td>" +
        js[i].is_manager +
        "</td></tr>";
    }
    h += "</table>";
    $("#data").html(h);
  });
}

function getdataprofile() {
  $.get("api.php?g=6", function (res) {
    js = JSON.parse(res);
    $("#n_usr").val(js[0].username);
    $("#n_pwd").val(js[0].password);
  });
}

function getusername() {
  $.get("api.php?g=6", function (res) {
    js1 = JSON.parse(res);
    $("#username1").html(js[0].username);
  });
}

//Show-Hide Password
$(document).ready(function () {
  $("#show_hide_password a").on("click", function (event) {
    event.preventDefault();
    if ($("#show_hide_password input").attr("type") == "text") {
      $("#show_hide_password input").attr("type", "password");
      $("#show_hide_password i").addClass("fa-eye-slash");
      $("#show_hide_password i").removeClass("fa-eye");
    } else if ($("#show_hide_password input").attr("type") == "password") {
      $("#show_hide_password input").attr("type", "text");
      $("#show_hide_password i").removeClass("fa-eye-slash");
      $("#show_hide_password i").addClass("fa-eye");
    }
  });
});
