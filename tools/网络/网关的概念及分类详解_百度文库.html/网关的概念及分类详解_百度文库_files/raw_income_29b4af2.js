define("wkview:widget/raw_income/raw_income.js",function(e,o,n){function t(e){this.options=e||{},this.step2Tmpl=a.template('<div class="WkDownload-activity">\n<div class="dialog-ad dialog-ad-nomarl">\n<div class="donwload-activity-dialog-container">\n<div class="myclose"></div>\n<div class="income-close-btn verify-close-btn" data-fun="close-dialog"></div>\n<div class="dialog-left-greenbar"></div>\n<div class="dialog-top">\n<p class="doc-title" rel="new-dialog" alt="dialog_tit">{{=it.tmpdata.docTitle}}</p>\n</div>\n<div class="dialog-inner tac">\n<div id="giftform">\n<div class="formgroup ie2 txtleft">\n<input type="text" placeholder="\u8bf7\u8f93\u5165\u59d3\u540d" placeholder="\u8bf7\u8f93\u5165\u59d3\u540d" name="name" class="ui-bz-ipt ui-bz-ipt-bgw fixplaceholder ic-name" autocomplete="off"/>\n<span class="errorinfo">\u8bf7\u586b\u5199\u59d3\u540d</span>\n</div>\n<div class="formgroup">\n<input class="ui-bz-ipt ui-bz-ipt-bgw fixplaceholder" type="text" placeholder="\u8bf7\u586b\u5199\u624b\u673a\u53f7\u7801" name="phone" autocomplete="off">\n<div class="sug phone-sug"></div>\n<span class="errorinfo">\u8bf7\u586b\u5199\u6b63\u786e\u7684\u624b\u673a\u53f7</span>\n</div>\n<div class="formgroup" style="display: none;">\n<div class="tel-wrap">\n<input class="ui-bz-ipt ui-bz-ipt-bgw fixplaceholder" type="text" placeholder="\u8bf7\u586b\u5199\u624b\u673a\u9a8c\u8bc1\u7801" name="phone_vcode" style="width: 139px;">\n<a href="javascript:;" class="ui-bz-btn-normal ui-bz-btn-51offer">\n<b class="ui-bz-btn-p-15 ui-bz-btc" data-fun="get-smsg">\u83b7\u53d6\u77ed\u4fe1\u9a8c\u8bc1\u7801</b>\n</a>\n</div>\n<span class="errorinfo" id="telerror">\u8bf7\u586b\u5199\u6b63\u786e\u624b\u673a\u9a8c\u8bc1\u7801</span>\n</div>\n<div class="formgroup form-err-group">\n<span class="errorinfo"></span>\n</div>\n</div>\n<a href="javascript:;" class="ui-bz-btn-senior btn-diaolog-downdoc"><b class="ui-bz-btn-p-16 ui-bz-btc" data-fun="submit-info">\u514d\u8d39\u4e0b\u8f7d</b></a>\n<div class="public-tip">\n{{=it.tmpdata.advertiser}}<span class="private">\n&nbsp;\u9690\u79c1\u4fdd\u969c<div class="hover-tip-hujiang">\n<span class="arrow-icon"></span>\n{{=it.tmpdata.privacy_policy}}</div>\n</span>\n</div>\n</div>\n</div>\n</div>\n</div>\n<div class="WkDownload-activity-iframe">\n<iframe allowTransparency="true" src="" frameborder="0" scrolling="no"></iframe>\n</div>\n'),this.init()}var i=e("wkcommon:widget/ui/lib/jquery/jquery.js"),a=e("wkcommon:widget/lib/doT/doT.min.js"),r=e("wkcommon:widget/lib/tangram/base/base.js"),s=e("wkcommon:widget/ui/js_core/log/log.js"),l=(e("wkcommon:widget/ui/js_core/dialog/dialog.js"),e("wkcommon:widget/ui/js_core/_dialog/_dialog.js"));t.prototype={init:function(){var e=this;e.addEventListener()},getHTML:function(e){var o="step"+(e||2)+"Tmpl";return this[o]({type:e||0,activity_id:this.activity_id})},closeDialog:function(e){var o=this;i(".WkDownload-activity, .WkDownload-activity-iframe").remove(),"function"==typeof e&&e(o)},showDialog:function(){var e=this,o=(i(window).height(),l.customDialog);new o({width:481,content:e.step2Tmpl({tmpdata:e.options}),closeSelector:".myclose",mask:{bgColor:"transparent"}}),e.placeholder(),e.getPhoneMsg()},getPhoneMsg:function(e){i.get("/org/interface/getphone?&t="+Math.random(),function(e){0===e.errno&&e.data.securemobil&&!e.data.is_same&&i(".phone-sug").html(e.data.securemobil)})},addEventListener:function(){var e=this;i("body").on("click",".dialog-ad",function(o){var n=i(o.target),t=n.attr("data-fun");switch(t){case"submit-info":var a=e.getFormData();if(a.keyword=encodeURIComponent(e.options.keyword),a.ad_id=e.options.ad_id,!e.checkData(a))return;i(".form-err-group").removeClass("err"),i.post("/org/interface/downloadtoeflorielts",a,function(o){var t=+o.errno,a={code0:"\u6210\u529f",code1:"\u59d3\u540d\u672a\u586b\u5199",code2:"\u624b\u673a\u53f7\u672a\u586b\u5199",code3:"\u624b\u673a\u53f7\u4e0d\u6b63\u786e",code4:"\u7cfb\u7edf\u9519\u8bef",code11:"\u8be5\u53f7\u7801\u5df2\u9886\u53d6\u8fc7\u793c\u5305,\u8bf7\u66f4\u6362\u53f7\u7801\u91cd\u8bd5",code31:"\u624b\u673a\u9a8c\u8bc1\u7801\u4e0d\u80fd\u4e3a\u7a7a",code32:"\u624b\u673a\u9a8c\u8bc1\u7801\u9519\u8bef",code33:"\u624b\u673a\u9a8c\u8bc1\u7801\u53d1\u9001\u8fc7\u4e8e\u9891\u7e41, \u8bf7\u7a0d\u540e\u91cd\u8bd5"};if(0===t){n.attr("data-fun",""),e.options.downloadUrl&&e.godownload(e.options.downloadUrl);var r=setTimeout(function(){clearTimeout(r),e.gonext()},1e3)}else 31===t||32===t?(i("#telerror").html(a["code"+t]||"\u7cfb\u7edf\u7e41\u5fd9, \u8bf7\u7a0d\u540e\u91cd\u8bd5"),e.showErr("phone_vcode")):(t="code"+t,i(".form-err-group .errorinfo").html(a[t]||"\u7cfb\u7edf\u7e41\u5fd9, \u8bf7\u7a0d\u540e\u91cd\u8bd5"),i(".form-err-group").addClass("err"))});break;case"get-smsg":var r=i(".dialog-ad input[name=phone]");if(!e.isTel(r.val()))return void r.css("border-color","red").siblings(".errorinfo").css("display","block");n.parent().addClass("ui-bz-btn-disable"),n.attr("data-fun","");var s="\u79d2\u540e\u91cd\u53d1",l=60,d="/org/interface/getphonevcode?phone="+r.val()+"&t="+Math.random();i.get(d,function(o){var t=+o.errno,a={code0:"\u6210\u529f",code11:"\u624b\u673a\u9a8c\u8bc1\u7801\u53d1\u9001\u8fc7\u4e8e\u9891\u7e41",code31:"\u624b\u673a\u9a8c\u8bc1\u7801\u672a\u4f20\u5165",code32:"\u64cd\u4f5c\u8fc7\u4e8e\u9891\u7e41\uff0c\u8bf7\u7a0d\u5019\u518d\u8bd5",code5:"\u64cd\u4f5c\u5931\u8d25 \u8bf7\u7a0d\u540e\u91cd\u8bd5"};if(t){t="code"+t,i("#telerror").html(a[t]),e.showErr("phone_vcode");var r=setInterval(function(){clearInterval(r),n.parent().removeClass("ui-bz-btn-disable"),n.text("\u83b7\u53d6\u77ed\u4fe1\u9a8c\u8bc1\u7801").attr("data-fun","get-smsg")},3e3)}else var d=setInterval(function(){l?(n.text(l+s),l--):(clearInterval(d),n.parent().removeClass("ui-bz-btn-disable"),n.text("\u83b7\u53d6\u77ed\u4fe1\u9a8c\u8bc1\u7801").attr("data-fun","get-smsg"))},1e3)})}}),i("body").on("blur","input[name=phone]",function(){var o=i(this),n=o.val();return e.rmErr("phone"),e.isTel(n)?void 0:void e.showErr("phone")}),i("body").on("blur","input[name=phone_vcode]",function(){var o=i(this).val();e.rmErr("phone_vcode"),i.trim(o)||(i("#telerror").html("\u9a8c\u8bc1\u7801\u4e3a\u7a7a"),e.showErr("phone_vcode"))}),i("body").on("keyup blur change",".dialog-ad .ic-name",function(){i.trim(i(this).val())?e.rmErr("name"):e.showErr("name")}),i("body").on("keyup blur change",".dialog-ad input[name=phone]",function(o){o.preventDefault();var n=i(this).val(),t=i(".phone-sug").html(),a=new RegExp("^"+n);return n===t?(i(".phone-sug").hide(),void i(".tel-wrap").parent().hide()):(e.isTel(n)&&n!==t&&i(".tel-wrap").parent().show(),n?void(a.test(t)?i(".phone-sug").show():i(".phone-sug").hide()):void i(".phone-sug").hide())}),i("body").on("click",".verify-close-btn",function(){i(".myclose").trigger("click"),i(".ys-ads-mask").hide()}),i("body").on("click",".phone-sug",function(){i(".dialog-ad input[name=phone]").val(i(this).html()),i(".dialog-ad input[name=phone]").trigger("blur"),i(this).hide()}),i("body").on("focus","#giftform input",function(){i(".form-err-group").removeClass("err")})},cancleEvent:function(){i("body").off("click",".phone-sug"),i("body").off("click",".verify-close-btn"),i("body").off("keyup blur change",".dialog-ad input[name=phone]"),i("body").off("blur","input[name=phone_vcode]"),i("body").off("blur","input[name=phone]"),i("body").off("click",".dialog-ad")},getFormData:function(){var e=i("#giftform").find(":input").serializeArray();return this.serialize2obj(e)},serialize2obj:function(e){for(var o={},n=0;n<e.length;n++)o[e[n].name]=encodeURIComponent(e[n].value);return o},checkData:function(e){var o=this,n=[];return i.trim(e.name)||(o.showErr("name"),n.push("name")),o.isTel(e.phone)||(o.showErr("phone"),n.push("phone")),n.length?(o.showErr(n),!1):!0},gonext:function(){var e=this;s.xsend(1,100896),i(".myclose").trigger("click"),new l.customDialog({width:465,height:230,content:e.options.downloadTpl({list:0,tmpdata:e.options}),closeSelector:".myclose",mask:{bgColor:"transparent"}})},godownload:function(e){var o='<iframe allowTransparency="true" src="'+e+'" frameborder="0" scrolling="no"></iframe>';i("body").append(o)},isTel:function(e){return!!e.match(/^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$/)},placeholder:function(){+r.browser.ie<=9&&i(".fixplaceholder").each(function(e,o){var n=i(o).attr("placeholder");i(o).val(n).click(function(){i(this).val()===n&&i(this).val("")}).blur(function(){var e=i(this).val();i.trim(e)||i(this).val(n)})})},showErr:function(e){var o=typeof e;if("string"===o)i("input[name="+e+"]").parents(".formgroup").addClass("err");else if("object"===o)for(var n=e.length-1;n>=0;n--)i("input[name="+e[n]+"]").parents(".formgroup").addClass("err")},rmErr:function(e){var o=typeof e;if("string"===o)i("input[name="+e+"]").parents(".formgroup").removeClass("err");else if("array"===o)for(var n=e.length-1;n>=0;n--)i("input[name="+e[n]+"]").parents(".formgroup").removeClass("err")}},n.exports=t});