// $(document).ready(function() {
//     updateCardContainer();
//
// function updateCardContainer() {
//     $.ajax({
//         url: 'cleanCheckList',
//         method: 'GET',
//         success: function (checkList) {
//             // Update the container with the received HTML.
//             $('#checkList').html(checkList);
//         },
//         error: function (error) {
//             console.error('Error:', error);
//         }
//     });
// }
// });

function CleaningInProgress(roomNumber) {
    // Perform an AJAX request to update the data on the server
    // Example using jQuery:
    $.ajax({
        url: '/updateCleaningInProgress',
        method: 'POST',
        data: {
            roomNumber: roomNumber,
        },
        success: function(response) {
            // Handle the success response
            console.log('Cleaning request sent');
        },
        error: function(error) {
            // Handle the error
            console.error('An error occurred while sending the cleaning request');
        }
    });
}



function CleaningComplete(roomNumber) {
    // Perform an AJAX request to update the data on the server
    // Example using jQuery:
    $.ajax({
        url: '/cleaningComplete',
        method: 'POST',
        data: {
            roomNumber: roomNumber,
        },
        success: function(response) {
            // Handle the success response
            console.log('변경완료(재실)');
        },
        error: function(error) {
            // Handle the error
            console.error('An error occurred while marking the cleaning as complete');
        }
    });
}