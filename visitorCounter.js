
function visitorCounter(event) {

    event.preventDefault()

    var data = {
        status: 'confirm'
    }

    fetch( "https://hen4qljed4.execute-api.us-east-1.amazonaws.com/resume_count2" , {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify(data),
        mode: "no-cors"
    })
}