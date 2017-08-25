$(document).ready(function(){
    $("input:radio").change(function(){
        if(this.value == '1' && this.name == 'listing[owner_id]'){
            $('#info').slideDown();
        }else {
            $('#info').slideUp();
        }
    })
});
