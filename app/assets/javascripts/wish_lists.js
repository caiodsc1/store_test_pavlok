function location_without(params) {
    return location.search.split('&').filter(e => {
        return params.filter(param => (e.startsWith(param) || e.startsWith(`?${param}`))).length === 0
    }).join('&')
}

function add_to_wish_list(product, path, token) {
    fetch(path, {
        method: "PATCH",
        headers: {
            'Accept': 'text/javascript',
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            utf8: "✓",
            wish_list: {wish_list_products_attributes: {0: {product_id: product.id}}},
            authenticity_token: token
        })
    }).then(r => r.text().then(
        data => ({ok: r.ok, data: data}))
    ).then(
        res => {
            if (res.ok) {
                eval(res.data);
                Swal.fire({
                    type: 'success',
                    title: 'Sucesso!',
                    timer: 1500,
                    text: `${product.name} foi adicionado à sua lista de compras!`
                })
            } else {
                Swal.fire({
                    type: 'error',
                    title: 'Oops...!',
                    timer: 1500,
                    text: JSON.parse(res.data).errors[0]
                })
            }
        }
    ).catch(
        err => {
            console.error(err);
        }
    );
}

$(document).on('ready turbolinks:load', function(){
    document.body.addEventListener('click', function (evt) {
        if (evt.target.className === "badge badge-light category") {
            evt.preventDefault();
            evt.target.parentElement.click();
            return;
        }
        if (evt.target.className === 'list-group-item selectable selected') {
            return;
        }
        if (evt.target.className === 'list-group-item selectable') {
            let beforeSelected = document.querySelectorAll(`[class="list-group-item selectable selected"]`);
            beforeSelected.forEach(function (e) {
                e.classList.remove('selected');
            });
            evt.target.classList.add('selected')
        }
    }, false);
});
