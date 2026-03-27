*** Settings ***
Library     SeleniumLibrary
Resource    ../Datos/variables.robot

*** Keywords ***
Abrir Demoblaze
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed  0.3s
    Wait Until Element Is Visible    link=Samsung galaxy s6    5s

Añadir Producto Al Carrito
    [Arguments]    ${producto}
    Click Link      ${producto}
    Click Element   class:btn-success
    Handle Alert    ACCEPT

Completar Formulario De Orden
    Input Text      id:name       ${nombre_usuario}
    Input Text      id:country    ${pais}
    Input Text      id:city       ${ciudad}
    Input Text      id:card       ${tarjeta}
    Input Text      id:month      ${mes}
    Input Text      id:year       ${anio}
    Click Element   css:[onclick="purchaseOrder()"]

Confirmar Compra Exitosa
    Element Should Be Visible    class:sweet-alert
    Page Should Contain          Thank you for your purchase!
    Click Button                 class:confirm

Registrar Nuevo Usuario
    [Arguments]    ${user}    ${pass}
    Click Element    id=signin2
    Wait Until Element Is Visible    id=sign-username    5s
    Input Text       id=sign-username    ${user}
    Input Text       id=sign-password    ${pass}
    Click Button     xpath=//button[text()='Sign up']
    Handle Alert     ACCEPT

Login Usuario
    [Arguments]    ${user}    ${pass}
    Click Element    id=login2
    Wait Until Element Is Visible    id=loginusername    5s
    Input Text       id=loginusername    ${user}
    Input Text       id=loginpassword    ${pass}
    Click Button     xpath=//button[text()='Log in']
    Wait Until Element Is Visible    id=logout2    10s

Cerrar Sesion
    Click Element    id=logout2
    Wait Until Element Is Visible    id=login2    5s

Validar Visualizacion De Precios
    Wait Until Element Is Visible    id=tbodyid    15s
    Wait Until Element Is Visible    xpath=//div[@id='tbodyid']//h5    15s
    Wait Until Element Contains      xpath=(//div[@id='tbodyid']//h5)[1]    $    10s
    Element Should Contain           xpath=(//div[@id='tbodyid']//h5)[1]    $

Ir Al Carrito
    Click Link    id=cartur
    Wait Until Element Is Visible    xpath=//h2[text()='Products']    5s
