#!usr/bin/perl

$range=15;
$ctrl=0;
$filename= 'alutest.txt';

open(INFO, '>', 'alutest.txt');

for ($i=0;$i<32;$i++)
{
	$A= int(rand($range));
	$B= int(rand($range));
	$Z= int(rand($range));
	$ctrl=$Z%4;
	
	if ($ctrl==0)
	{
		$Z=$A+$B;
		if($Z>15)
		{
			$Z=$Z %16;
		}
	}
	elsif($ctrl==1)
	{
        $Z = $A & $B;
    }
    elsif($ctrl == 2)
    {
        $Z = $A << $B;
        if($Z >15)
        {
         $Z = 0;
        }
    }
	else
    {
        $Z = $A >> $B;
    }
	
	printf INFO "%04b%04b%02b%04b\n", $A, $B, $ctrl, $Z;
	
}

