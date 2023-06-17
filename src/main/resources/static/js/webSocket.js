let stompClient = null;
let fullText = $("#test").html();

$(document).ready(function() {
    console.log("Index page is ready");
    connect();

    $("#send").click(function() {
        sendMessage();
    });

    $("#send-private").click(function() {
        sendPrivateMessage();
    });

    // $("#btn-cleanask").click(function() {
    //     cleanaskSendMessage();
    // });

});

function connect() {
    let socket = new SockJS('/our-websocket');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
        console.log('Connected: ' + frame);

        stompClient.subscribe('/topic/messages', function (message) {
            showMessage(JSON.parse(message.body).content);
        });
        stompClient.subscribe('/user/topic/private-messages', function (message) {
            showMessage(JSON.parse(message.body).content);
        });
    });
}

function showMessage(message) {
    $("#messages").append(
        "<a class=\"dropdown-item dropdown-notifications-item\" href=\"#!\">" +

            "<div class=\"dropdown-notifications-item-content-text\">" + message + "</div>" +
        "</a>"

    );
}

function cleanaskSendMessage() {
    console.log("cleanaskSendMessage")
    stompClient.send("/ws/private-message", {}, JSON.stringify({'messageContent': "객실 청소요청이 들어왔습니다."}));
}

function sendPrivateMessage() {      // 프라이빗 메시지를 서버로 보내는 함수, stompClient 객체를 사용하여 "/ws/private-message" 주소로 메시지를 전송
    console.log("sending private message");
    stompClient.send("/ws/private-message", {}, JSON.stringify({'messageContent': "객실 청소요청이 들어왔습니다."}));
}

function sendMessage() {
    console.log("sending message");
    stompClient.send("/ws/message", {}, JSON.stringify({'messageContent': $("#message").val()}));
}
