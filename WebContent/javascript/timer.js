function display(notifier, str )
{
	document.getElementById( notifier ).innerHTML = str;
}

function toMinuteAndSecond( x )
{
    return Math.floor( x / 60 ) + ':' +  ( x % 60 );
}

function setTimer( remain, actions )
{
    ( function countdown()
    {
        display( 'countdown', toMinuteAndSecond( remain ) );
        actions[remain] && actions[remain]();
        (remain -= 1) >= 0 && setTimeout( arguments.callee, 1000 );
    })();
}


function startTimer()
{	
	var time=document.getElementById('nb').value * 60;
		
    setTimer( time, {   	
        59: function()
        {
            display( 'notifier', 'seconds');
        },       
        0: function()
        { 
            display( 'notifier', 'Time has expired!');
        }
    } );
}
