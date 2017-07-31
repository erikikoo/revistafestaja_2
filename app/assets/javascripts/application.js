// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require materialize-sprockets
//= require twitter/bootstrap
//= require maskedinput
//= require bootstrap-datepicker
//= require bootstrap-datepicker/locales/bootstrap-datepicker.pt-BR.js
//= require jquery_ujs
//= require turbolinks
//= require data-confirm-modal
// require jquery.turbolinks
//= require cocoon
//= require twitter/bootstrap/modal
//= require_tree .




jQuery(document).ready(function($) {
  $('.btn-topo').css('display', 'none');

 //ao Realizar pesquisa scrola para topo  
   $("#cliente_search").submit(function(event) {
     $('html body').animate({scrollTop: 0}, 800);
      
  
   });
   //ao clicar no btn scrola para topo  
   $('.btn-topo').click(function(){     
    $('html body').animate({scrollTop: 0}, 800);
    return false;
  });  

	

// apresenta o botão de retornar no topo quando scrola pag
  $(window).scroll(function(){
    
    if($(this).scrollTop() > 300) {
      $('.btn-topo').fadeIn('fast');
    } else {
      $('.btn-topo').fadeOut('fast');
    }

    if($(this).scrollTop() > 290) {
    //apresenta e esconde o search menu  se o scroll for maioir que o valor acima
      apagaFieldSearch('.4');
      mostraFieldSearch('1');    

      // fixa o campo pesquisa no topo
      // $('#index-cliente-btn').css({
      //   position: 'fixed',
      //   padding: '30px',                
      //   height: '100px',
      //   background: 'tomato',
      //   top: '0px',
      //   margin: '0 auto',
      //   left: '0',
      //   width: '100%'
      // });  
     // se o campo de pesquisa estiver  selecionado não esconde o mesmo
      if(!$('#q_razao_social_cont').is(':focus')) {    
        $('#index-cliente-btn').css({
          opacity: '.4'
        });      
      }  
      

    } else {     
	   	
      $('#index-cliente-btn').css({    	    	  	
    	  	opacity: '1'
    	});
      
      apagaFieldSearch('1');
	   	// volta o campo pesquisa
      // $('#index-cliente-btn').css({
      //   position: 'relative',
      //   top: '300px',
      //   background: 'none',
      //   padding: '0',
      // });
    }
  });
        
// painel mensagem
	$("#notice").fadeTo(2000, 500).slideUp(500, function(){
    	$("#success-alert").slideUp(500);
	});

	$("#q_nome_cont").focus(function() {
		$(this).width() = 300; 
	});


	// masrcara para o form phone
  var SPMaskBehavior = function (val) {
  return val.replace(/\D/g, '').length === 11 ? '(00) 00000-0000' : '(00) 0000-00009';
	},
		spOptions = {
		  onKeyPress: function(val, e, field, options) {
	      field.mask(SPMaskBehavior.apply({}, arguments), options);
	    }
	};

  $('.telefones').mask(SPMaskBehavior, spOptions);
  $('#artist_data_phones_attributes_0_telefone').mask(SPMaskBehavior, spOptions);
  $('#commitment_telefone').mask(SPMaskBehavior, spOptions);
  

  dataConfirmModal.setDefaults({
    title: 'Atenção',
    commit: 'Confirmar',
    cancel: 'Cancelar'
  });
 
});

function apagaFieldSearch(val) {
  $('#q_razao_social_cont').blur(function(event) {
    
        
        $('#index-cliente-btn').css({       
          opacity: val
        });
     
  });
}

function mostraFieldSearch(val) {
  $('#q_razao_social_cont').focus(function(event) {
        $('#index-cliente-btn').css({       
          opacity: val
        });
      });
}

function altScroll(altura) { // function centraliza pagina
    $('html').animate({scrollTop: altura}, 800);
  }