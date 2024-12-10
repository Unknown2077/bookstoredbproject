<?php
session_start();
		$servername = "localhost";
		$username = "root";
		$password = "";

		$conn = new mysqli($servername, $username, $password);

		if ($conn->connect_error) {
			die("Connection failed: " . $conn->connect_error);
		} 

		$sql = "USE bookstore";
		$conn->query($sql);

		if(isset($_POST['ac']) && isset($_POST['quantity'])) {
			$sql = "SELECT * FROM book WHERE BookID = '".$_POST['ac']."'";
			$result = $conn->query($sql);

			if($row = $result->fetch_assoc()) {
				$bookID = $row['BookID'];
				$quantity = $_POST['quantity'];
				$price = $row['Price'];
				if (!isset($_SESSION['id'])) {
					header("Location: login.php");
					exit();
				}
				$totalPrice = $price * $quantity;

				$sql = "INSERT INTO cart(BookID, Quantity, Price, TotalPrice) VALUES('".$bookID."', ".$quantity.", ".$price.", ".$totalPrice.")";
				$conn->query($sql);
			}
		}
	/* delc: Unknown word */
	if(isset($_POST['delc'])){
		$servername = "localhost";
		$username = "root";
		$password = "";

		$conn = new mysqli($servername, $username, $password);

		if ($conn->connect_error) {
			die("Connection failed: " . $conn->connect_error);
		} 

		$sql = "USE bookstore";
		$conn->query($sql);

		$sql = "DELETE FROM cart";
		$conn->query($sql);
	}

	$servername = "localhost";
	$username = "root";
	$password = "";

	$conn = new mysqli($servername, $username, $password);

	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	} 

	$sql = "USE bookstore";
	$conn->query($sql);    

	$sql = "SELECT * FROM book";
	$result = $conn->query($sql);
?>  

<?php
if(isset($_SESSION['id'])){
	echo '<header>';
	/* edituser: Unknown word */
	echo '<form class="hf" action="edituser.php"><input class="hi" type="submit" name="submitButton" value="Edit Profile"></form>';
	echo '<a href="index.php"><img src="image/logo.png"></a>';
	echo '<form class="hf" action="logout.php"><input class="hi" type="submit" name="submitButton" value="Logout"></form>';
	echo '<form class="hf" action="edituser.php"><input class="hi" type="submit" name="submitButton" value="Edit Profile"></form>';
	echo '</blockquote>';
	echo '</header>';
}

if(!isset($_SESSION['id'])){
	echo '<header>';
	echo '<blockquote>';
	echo '<a href="index.php"><img src="image/logo.png"></a>';
	echo '<form class="hf" action="Register.php"><input class="hi" type="submit" name="submitButton" value="Register"></form>';
	echo '<form class="hf" action="login.php"><input class="hi" type="submit" name="submitButton" value="Login"></form>';
	echo '</blockquote>';
	echo '</header>';
}
echo '<blockquote>';
echo "<div class='main-container'>";
	echo "<div class='book-container'>";
	while($row = $result->fetch_assoc()) {
		echo "<div class='book-item'>";
		echo '<img src="'.$row["Image"].'">';
		echo '<div>Title: '.$row["BookTitle"].'</div>';
		echo '<div>Type: '.$row["Type"].'</div>';
		echo '<div>IDR'.$row["Price"].'</div>';
		echo '<div>
			<form action="index.php" method="post">
			Quantity: <input type="number" value="1" name="quantity" style="width: 20%"/><br>
			<input type="hidden" value="'.$row['BookID'].'" name="ac"/>
			<input class="button" type="submit" value="Add to Cart"/>
			</form>
		</div>';
		echo "</div>";
	}
	echo "</div>";

	$sql = "SELECT book.BookTitle, book.Image, cart.Price, cart.Quantity, cart.TotalPrice FROM book,cart WHERE book.BookID = cart.BookID;";
	$result = $conn->query($sql);

	echo "<div class='cart-container'>";
	echo "<table>";
	echo "<th><i class='fa fa-shopping-cart' style='font-size:24px'></i> Cart <form style='float:right;' action='' method='post'><input type='hidden' name='delc'/><input class='cbtn' type='submit' value='Empty Cart'></form></th>";
	$total = 0;
	while($row = $result->fetch_assoc()){
		echo "<tr><td>";
		echo '<img src="'.$row["Image"].'">';
		echo $row['BookTitle']."<br>IDR".$row['Price']."<br>";
		echo "Quantity: ".$row['Quantity']."<br>";
		echo "Total Price: IDR".$row['TotalPrice']."</td></tr>";
		$total += $row['TotalPrice'];
	}
	echo "<tr><td class='total'>";
	echo "Total: <b>IDR".$total."</b><center><form action='checkout.php' method='post'><input class='button' type='submit' name='checkout' value='CHECKOUT'></form></center>";
	echo "</td></tr>";
	echo "</table>";
	echo "</div>";
	echo '</div>';
	echo '</blockquote>';
?>

<!DOCTYPE html>
<>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf8"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="style.css">
<style>
	.book-container {
		display: flex;
		flex-wrap: wrap;
		justify-content: space-between;
		width: 75%;
	}
	.book-item {
		width: 23%;
		margin-bottom: 20px;
		border: 1px solid #ddd;
		border-radius: 5px;
		overflow: hidden;
		box-shadow: 0 2px 5px rgba(0,0,0,0.1);
	}
	.book-item img {
		width: 100%;
	}
	.book-item div {
		padding: 10px;
	}
	.cart-container {
		width: 23%;
		margin-left: 2%;
		border: 1px solid #ddd;
		border-radius: 5px;
		padding: 10px;
		box-shadow: 0 2px 5px rgba(0,0,0,0.1);
	}
	.main-container {
		display: flex;
	}
	.cart-container table {
		width: 100%;
		border-collapse: collapse;
	}
	.cart-container th, .cart-container td {
		padding: 10px;
		border-bottom: 1px solid #ddd;
	}
	.cart-container th {
		background-color: #333;
		color: white;
	}
	.cart-container img {
		width: 50px;
		height: auto;
		margin-right: 10px;
	}
	.cart-container .total {
		text-align: right;
		background-color: #f2f2f2;
		padding: 10px;
	}
	.cart-container .button {
		background-color: #4CAF50;
		color: white;
		border: none;
		padding: 10px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 16px;
		margin: 4px 2px;
		cursor: pointer;
		border-radius: 5px;
	}
	/* cbtn: Unknown word */
	.cart-container .cbtn {
		background-color: #f44336;
		color: white;
		border: none;
		padding: 5px 10px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 14px;
		margin: 4px 2px;
		cursor: pointer;
		border-radius: 5px;
	}
</style>
</head>