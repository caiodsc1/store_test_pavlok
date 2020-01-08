$(document).ready(function() {
    start_new_wish_list();
});

function start_new_wish_list(token) {
    Swal.fire({
        title: 'Bem-vindo ao Wish List!',
        text: 'Escolha o nome da sua lista de compras:',
        input: 'text',
        inputAttributes: {
            autocapitalize: 'off'
        },
        customClass: {
            confirmButton: 'btn btn-danger btn-lg'
        },
        inputValidator: (value) => {
            return !value && 'Você precisa digitar um nome!'
        },
        showCancelButton: false,
        confirmButtonText: 'Go!',
        showLoaderOnConfirm: true,
        buttonsStyling: false,
        preConfirm: (name) => {
            return fetch(`/wish_lists`, {
                method: "post",
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ utf8: "✓", wish_list: { name: name },  authenticity_token: token  })
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error(response.statusText)
                    }
                    return response.json()
                })
                .catch(error => {
                    Swal.showValidationMessage(
                        `Request failed: ${error}`
                    )
                })
        },
        allowOutsideClick: () => !Swal.isLoading()
    }).then((result) => {
        if (result.value) {
            window.location.pathname = result.value.url;
        }
    })
}
