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


TC_05_Registro_De_Usuario_Exitoso

    Abrir Demoblaze
    Registrar Nuevo Usuario    ${user}    ${pass}
    [Teardown]    Close Browser

TC_06_Cerrar_Sesion_Usuario

    Abrir Demoblaze
    Login Usuario              ${user}    ${pass}
    Cerrar Sesion
    [Teardown]    Close Browser

TC_07_Verificar_Precios_En_Home

    Abrir Demoblaze
    Validar Visualizacion De Precios
    [Teardown]    Close Browser

TC_08_Verificar_Actualizacion_Del_Carrito
    Abrir Demoblaze
    Añadir Producto Al Carrito    link=Samsung galaxy s6
    Ir Al Carrito
    Wait Until Element Is Visible    id=tbodyid    10s
    Element Should Be Visible        xpath=//td[text()='Samsung galaxy s6']
    Element Should Contain           xpath=(//td)[3]    360
    [Teardown]    Close Browser