<?php

/*********************************
*                                *
* PayPal PHP Manager             *
* By Jeremy Desvaux              *
* June 2010                      *
* Creative Commons               *
*                                *
**********************************/

class paypalcheckout {

    //==> Class Variables <==/
    public $business;
    public $currency;
    public $cursymbol;
    public $location;
    public $returnurl;
    public $returntxt;
    public $cancelurl;
    public $custom;
    public $items;

//=======================================================================//
//==> Class constructor, with default settings that can be overridden <==//
//=======================================================================//
public function __construct($customi=""){

  //default settings
  $settings = array(
  'business' => 'thesunyangel-facilitator@yahoo.com',         //paypal email address
  'currency' => 'USD',                       //paypal currency
  'cursymbol'=> '&dollar;',                   //currency symbol
  'location' => 'US',                        //location code  (ex GB)
  'returnurl'=> 'http://mysite/myreturnpage',//where to go back when the transaction is done.
  'returntxt'=> 'Return to My Site',         //What is written on the return button in paypal
  'cancelurl'=> 'http://mysite/mycancelpage',//Where to go if the user cancels.
  'shipping' => 0,                           //Shipping Cost
  'custom'   => $customi                          //Custom attribute
  );

  

  //Set the class attributes
  $this->business  = $settings['business'];
  $this->currency  = $settings['currency'];
  $this->cursymbol = $settings['cursymbol'];
  $this->location  = $settings['location'];
  $this->returnurl = $settings['returnurl'];
  $this->returntxt = $settings['returntxt'];
  $this->cancelurl = $settings['cancelurl'];
  $this->shipping  = $settings['shipping'];
  $this->custom    = $settings['custom'];
  $this->items = array();

}


    //=====================================//
    //==> Add a simple item to the cart <==//
    //=====================================//
    public function addSimpleItem($item){		
     
      if( //Check the quantity and the name
        !empty($item['quantity']) 
        && is_numeric($item['quantity']) 
        && $item['quantity']>0 
        && !empty($item['item_name'])
      ){ //And add the item to the cart if it is correct
       
        $items = $this->items;
        $items[] = $item;
        $this->items = $items;
      }
     
    }


    //=========================================//
    //==> Add an array of items to the cart <==//
    //=========================================//
    public function addMultipleItems($items){

        if(!empty($items)){foreach($items as $item){ //lopp through the items
            $this->addSimpleItem($item);  //And add them 1 by 1
        }}
    }


    //==================================================//
    //==> Returns a summary list of the cart content <==//
    //==================================================//
    public function getCartContentAsHtml($hidetotal=0){
        $content='<ul id="cartcontent">'; $total=0; $count = 0;
        $cpt=1;
        if(!empty($this->items)){foreach($this->items as $item){
          $amount = $item['quantity']*$item['amount'];
          $content.='<li class="cartitem">'.$item['quantity'].' x "'.$item['item_name'].'" at '.$this->cursymbol.''.$item['amount'];
          if($item['shipping']>0)$content.= ' + '.$this->cursymbol.''.$item['shipping'].' shipping ';
          $content.=' for '.$this->cursymbol.''.$amount;
          $content.='</li>';
          $total+=$amount;
          $count+=$item['quantity'];
          $cpt++;
       }}	
       if($hidetotal!=1){ $content.='<li class="carttotal">Total: '.$count.' Items for '.$this->cursymbol.''.$total.'</li>'; }
       $content.='</ul>';
       return $content;
    }

    //=====================//
    //==> Checkout Form <==//
    //=====================//
    public function getCheckoutForm(){

        $form='
        <form id="paypal_checkout" action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">';

        //==> Variables defining a cart, there shouldn't be a need to change those <==//
        $form.='
        <input type="hidden" name="cmd" value="_cart" />
        <input type="hidden" name="upload" value="1" />			
        <input type="hidden" name="no_note" value="0" />						
        <input type="hidden" name="bn" value="MercyHands_Donate_WPS_US" />					
        <input type="hidden" name="tax" value="0" />			
         <input type="hidden" name="no_shipping" value="1" />
        <input type="hidden" name="rm" value="2" />';
    
        //==> Personnalised variables, they get their values from the specified settings nd the class attributes <==//
       $form.='
       <input type="hidden" name="business" value="'.$this->business.'" />
       <input type="hidden" name="handling_cart" value="'.$this->shipping.'" />
       <input type="hidden" name="currency_code" value="'.$this->currency.'" />
       <input type="hidden" name="lc" value="'.$this->location.'" />
       <input type="hidden" name="return" value="'.$this->returnurl.'" />			
       <input type="hidden" name="cbt" value="'.$this->returntxt.'" />
       <input type="hidden" name="cancel_return" value="'.$this->cancelurl.'" />			
       <input type="hidden" name="custom" value="'.$this->custom.'" />';

       //==> The items of the cart <==//
       $cpt=1;
       if(!empty($this->items)){
        foreach($this->items as $item){
         $form.='<div id="item_'.$cpt.'" class="itemwrap">';
               foreach($item as $id=>$val){
         $form.='
            <input type="hidden" name="'.$id.'_'.$cpt.'" value="'.$val.'" />
           ';
            }
         
         $form.='</div>';
         $cpt++;
       }}

       //==> The submit button, (you can specify here your own button) <==//
       //
       $form.='
<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">       </form>';

       return $form;
    }
}


$title = $vars['title'];
$amount=(float)$vars['amount'];
$custom=(int)$vars['custom'];
$items = array(
    "item_name" => "$title",
    "amount" => $amount,
    "quantity" => 1,
    "shipping" => 0
);


if(strlen($custom)>0){
$pp = new paypalcheckout($custom);
$pp->addSimpleItem($items);
msg(true,$pp->getCheckoutForm());
}
else
{
  msg(false,"Somthing went wrong , please refresh the page!");
}
?>