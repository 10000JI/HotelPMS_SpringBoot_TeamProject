$(document).ready(function() {
    $('.dropdown-item').click(function() {
        let selectedRoomType = $(this).data('roomtype');
        $('#selectedRoomTypeButton').text(selectedRoomType);
    });
});