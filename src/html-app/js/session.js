$(function () {
    // Binding initial values to drop down
    session.view.bindSectionDropdown();

    // Event binding
	session.models.ele.btnSectionNext.on('click', session.controller.eventNext);
});
var session = {
    models: {
        ele: {
            ddSection: $('#ddSection')

            , btnSectionNext: $('#btnStart')

            , txtBook: $('#txtBook')
            , txtQuesNo: $('#startQuestion')

        }
        
    }
    , controller: {

        eventNext: function () {
            session.controller.bindSessionObject();
			session.controller.disableSessionControls();
        }
		
		, validateSessionControls : function(){
			// to do: incorporate a jquery validator for the controls
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
    }
};
