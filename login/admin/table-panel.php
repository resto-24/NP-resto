<?php
session_start(); // Ensure session is started
//require_once '../posBackend/checkIfLoggedIn.php';
?>
<?php
 // include '../inc/dashHeader.php'
 include './heading.php';
?>   
 <link rel="stylesheet" href="./CSS/tablestyle.css">
 <link rel="stylesheet" href="./CSS/menustyle.css">
    <style>
        .wrapper{ width: 50%; padding-left: 200px; padding-top: 20px  }
    </style>
  
<div class="wrapper">
                        <h2 class="pull-left">Table Details</h2>
                        <div class="additem">
                        <a href="../admin/tableCrud/createTable.php" class="btnitem"><i class="fa fa-plus"></i> Add Table</a>
</div>
                    <form method="post" action="#">
                        <div class="row">
                            
                                <input required type="text" id="search" name="search" class="form-control" placeholder="Enter Table ID, Capacity">
                        </div>
                            <div class="colmd" >
                                <button type="submit" class="btn btn-dark">Search</button>
                            </div>
                            <div class="col" style="text-align: right;" >
                                <a href="table-panel.php" >Show All</a>
                            </div>
                        
                    </form>
                
                    <?php
                    // Include config file
                    require_once "../config.php";
                    
                    if (isset($_POST['search'])) {
                        if (!empty($_POST['search'])) {
                            $search = $_POST['search'];
                            $sql = "SELECT * FROM restaurant_tables WHERE item_id LIKE '%$search%' OR capacity LIKE '%$search%' ORDER BY item_id;";
                        } else {
                            // Default query to fetch all items
                            $sql = "SELECT * FROM restaurant_tables  ORDER BY item_id;";
                            }
                    } else {
                        // Default query to fetch all items
                        $sql = "SELECT * FROM restaurant_tables  ORDER BY item_id;";
                        }
                    


                    // Attempt select query execution
                    $sql = "SELECT * FROM restaurant_tables ORDER BY table_id;";
                    if($result = mysqli_query($link, $sql)){
                        if(mysqli_num_rows($result) > 0){
                            echo '<table border="1" class="table-body">';
                                echo "<thead>";
                                    echo "<tr>";
                                        echo "<th>Table ID</th>";
                                        echo "<th>Capacity</th>";
                                        echo "<th>Availability</th>";
                                     //   echo "<th>Delete</th>";
                                    echo "</tr>";
                                echo "</thead>";
                                echo "<tbody>";
                                while($row = mysqli_fetch_array($result)){
                                    echo "<tr>";
                                        echo "<td>" . $row['table_id'] . "</td>";
                                        echo "<td>" . $row['capacity'] . " Persons </td>";
                                        if ($row['is_available'] == true) {
                                            echo "<td>" . "Yes" . "</td>";
                                        } else {
                                            echo "<td>" . "No" . "</td>";
                                        }
                                      
                                        echo "<td>";
                                       $deleteSQL = "DELETE FROM Reservations WHERE reservation_id = '" . $row['table_id'] . "';";
                                        echo '<a class="icon" href="TableCrud/deleteTable.php?id='. $row['table_id'] .'" title="Delete Record" data-toggle="tooltip" '
                                                  . 'onclick="return confirm(\'Are you sure you want to delete this Table?\n\nThis will alter other modules related to this Table!\')"><span class="fa fa-trash text-black"></span></a>';
                                        echo "</td>";
                                    echo "</tr>";
                                }
                                echo "</tbody>";                            
                            echo "</table>";
                            // Free result set
                            mysqli_free_result($result);
                        } else{
                            echo '<div class="alert alert-danger"><em>No records were found.</em></div>';
                        }
                    } else{
                        echo "Oops! Something went wrong. Please try again later.";
                    }
 
                    // Close connection
                    mysqli_close($link);
                    ?>
                
<?php  //include '../inc/dashFooter.php'?>

