var MsgBox = {
		/* Alert */
		Alert: function(msg) {
			new Promise((resolve, reject) => {
				$("#msg_popup #btn_confirm").hide();
				$("#msg_popup #btn_alert").show();
				
				$("#msg_popup #alert_ok").unbind();
				$("#msg_popup .modal-body").html(msg);
				$('#msg_popup').modal('show');

				$("#msg_popup #alert_ok").click(function() {
					$('#msg_popup').modal('hide');
				});

			});
		},

		/* Confirm */
		Confirm: function(msg, yeshandler, nohandler) {
			new Promise((resolve, reject) => {
				var flag = false;
				$("#msg_popup #btn_alert").hide();
				$("#msg_popup #btn_confirm").show();
				
				$("#msg_popup #confirm_yes").unbind();
				$("#msg_popup #confirm_no").unbind();
				$("#msg_popup .modal-body").html(msg);
				$('#msg_popup').modal('show');

				$('#msg_popup').on('keypress', function (e) {
					var keycode = (e.keyCode ? e.keyCode : e.which);
					if(keycode == '13') {
						flag = true;
						$('#msg_popup').modal('hide');
					}
				});

				$("#msg_popup #confirm_yes").click(function() {
					flag = true;
				});
				$("#msg_popup #confirm_no").click(function() {
					flag = false;
				});

				$("#msg_popup").on("hidden.bs.modal", function(e) {
					e.stopPropagation();
					if(yeshandler != null && flag == true) resolve(1); 
					else if(nohandler != null && flag == false) resolve(2);
					else reject();
				});

			}).then(function(value) {
				if(value == 1)      yeshandler();
				else if(value == 2) nohandler();
			}).catch(function() {});
		},
	}

	const navtab = {

    init: function(){
        this.motab();
    },
    motab: function() {
        let mBtn = $(".mBtn");
        let closeBtn = $(".closeBtn");

        // 모바일 버튼 클릭
        $(mBtn).click(function(){
            $(".mNav").addClass("on");
            $(".bg-shadow").css("display", "block");
        });
        // 화면 클릭
        $(".bg-shadow").click(function(){
            $(".mNav").removeClass("on");
            $(".bg-shadow").css("display", "none");
        });
        // 닫기 버튼 클릭
        $(closeBtn).click(function(){
            $(".mNav").removeClass("on");
            $(".bg-shadow").css("display", "none");
        });
    }
}

$(document).ready(function(){
    navtab.init();
	//MsgBox.Alert("Alert Message!", function() {MsgBox.Alert("OK");});
})
