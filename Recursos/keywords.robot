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

