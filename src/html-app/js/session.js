$(function () {
    // Binding initial values to drop down
    session.view.bindSectionDropdown();

    // Event binding
	session.models.ele.btnSectionNext.on('click', session.controller.eventNext);
	
	// Initialize Controls
	session.view.initControls();
});
var session = {
    models: {
        ele: {
            ddSection: $('#ddSection')

            , btnSectionNext: $('#btnStart')

            , txtBook: $('#txtBook')
            , txtQuesNo: $('#startQuestion')
			, divErrorMessage: $('#errorMsgDiv div.span9')
        }
        
    }
    , controller: {

        eventNext: function () {
            session.controller.bindSessionObject();
			if(session.controller.validateSessionControls()){
				session.controller.disableSessionControls();
			}
        }
		
		, validateSessionControls : function(){
			var isValid = true;
			if(session.models.ele.txtBook.val() == '' || session.models.ele.txtQuesNo.val() == '' || session.models.ele.txtQuesNo.val().search(/^\d+$/) == -1)
				isValid = false;
			
			if(!isValid)
				session.models.ele.divErrorMessage.show('slow');
			else
				session.models.ele.divErrorMessage.hide('slow');
			return isValid;
		}
		
		, bindSessionObject: function(){
			app.session.book = session.models.ele.txtBook.val();
            app.session.section = session.models.ele.ddSection.val();
            app.session.date = new Date();
            app.session.startQNo = session.models.ele.txtQuesNo.val();
		}
		
		, disableSessionControls: function(){
			session.models.ele.ddSection.attr('disabled','disabled');
			session.models.ele.txtBook.attr('disabled','disabled');
			session.models.ele.txtQuesNo.attr('disabled','disabled');
		}
		
		, moveAnswerSection: function(){
			// to do: refer twitter bootstrap to activate tabs from javascript
		}

    }
    , view: {
        bindSectionDropdown: function () {
            var strDropdown = '';
            $.each(constant.section, function (index, obj) {
                strDropdown += '<option value=' + index + '> ' + obj + '</option>';
            });
            session.models.ele.ddSection.html(strDropdown);
        }
		, initControls: function(){
			// session.models.ele.alertMessage.alert('close');
		}
    }
};
