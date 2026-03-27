*** Settings ***
Library     SeleniumLibrary
Resource    ../Recursos/keywords.robot
Resource    ../Datos/variables.robot

*** Test Cases ***
TC_01_Agregar_Producto_Al_Carrito
    Abrir Demoblaze
    Añadir Producto Al Carrito    ${producto_phones}
    Click Link                    id=cartur
    Element Should Contain        id:tbodyid    ${producto_phones}
    [Teardown]                    Close Browser

TC_02_Flujo_Compra_Completo
    Abrir Demoblaze
    Añadir Producto Al Carrito    ${producto_phones}
    Click Link                    id:cartur
    Click Element                 class:btn-success
    Completar Formulario De Orden
    Confirmar Compra Exitosa
    [Teardown]                    Close Browser

TC_03_Navegacion_Categorias
    Abrir Demoblaze
    Click Link                    Phones
    Page Should Contain           ${producto_phones}
    Click Link                    Laptops
    Page Should Contain           ${producto_laptops}
    Click Link                    Monitors
    Page Should Contain           ${producto_monitors}
    [Teardown]                    Close Browser

TC_015_Envio_Formulario_Contacto
    Abrir Demoblaze
    Click Link                    Contact
    Input Text                    id:recipient-email    ${email_contacto}
    Input Text                    id:recipient-name     ${nombre_usuario}
    Input Text                    id:message-text       ${msj_contacto}
    Click Element                 css:.btn-primary
    Handle Alert                  ACCEPT
    [Teardown]                    Close Browser