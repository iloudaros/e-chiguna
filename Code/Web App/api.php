<?php
	session_start();
	require_once('config.php');
	$conn=mysqli_connect($host, $username, $passwd, $dbname);
	mysqli_query($conn,"set names 'utf8'");
	if($_GET['g']==1)
	{
		
		if(mysqli_query($conn,"insert into user 
					set username='$_POST[usr]', 
					password='$_POST[pwd]', 
					email='$_POST[eml]',is_manager=0"))
					{
						echo 1;
					}
		else
				{				
					echo 0;
				}
	
	
	}
	
	if($_GET['g']==2)
	{
		
		$t=mysqli_query($conn,"select * from user 
					where username='$_POST[usr]' and
					password='$_POST[pwd]'");
		if(mysqli_num_rows($t)>0)
					{
						$row=mysqli_fetch_array($t);
						$_SESSION['usr']=$row['username'];
						echo 1;
					}
		else
				{
					$_SESSION['usr']="";
					echo 0;
				}
	
	}
	
	if($_GET['g']==3)
	{
		session_destroy();
	}
	


    if($_GET['g']==4)
    {
        
        if(mysqli_query($conn,"update user 
                    set username='$_POST[n_usr]',
					password='$_POST[n_pwd]' where username='$_SESSION[usr]'"))
                    {
						$_SESSION['usr']="$_POST[n_usr]";
                        echo 1; 
                    }
        else
                {				
                    echo 0;
                }
    
    
    }



	if($_GET['g']==5)
	{
		$t=mysqli_query($conn,"select * from user");
		$J=[];
		while($r=mysqli_fetch_assoc($t))
		{
			$J[]=$r;
		}
		echo json_encode($J);
	
	}

	if($_GET['g']==6)
	{
		
		$t=mysqli_query($conn,"select * from user where username='$_SESSION[usr]'");
		$J=[];
		while($r=mysqli_fetch_assoc($t))
		{
			$J[]=$r;
		}
		echo json_encode($J);
	
	}

	

?>
