<#include "navbar-menus.ftl">
<#--<nav id="loginbar" class="top-bar main-header navbar navbar-expand-xl navbar-light navbar-white">-->
<#--    <div class="container-fluid">-->
<#--        <div class="groupSelector">-->
<#--            <div class="float-right">-->
<#--              <ul class="order-1 order-md-3 navbar-nav navbar-no-expand ml-auto loginbar">-->
<#--                <@rightmenus></@rightmenus>-->
<#--              </ul>-->
<#--            </div>-->
<#--        </div>-->
<#--    </div>-->
<#--</nav>-->

<nav id="menubar" class="main-header navbar navbar-expand-xl navbar-light navbar-white">
  <div class="container-fluid">
    <#if config??>
      <a href="${portalLink}" class="navbar-brand">
        <img src="${brandImageSrc}" alt="Logo" class="brand-image ${brandImageClass}"
             style="opacity: .8">
      </a>
    <#else>
      <img src="${brandImageSrc}" alt="Logo" class="brand-image ${brandImageClass}"
           style="opacity: .8">
      <span class="brand-text ${brandTextClass}"></span>
    </#if>

    <button class="navbar-toggler order-1" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="display-content navbar-collapse collapse order-3 justify-content-end" id="navbarCollapse">
      <!-- Left navbar links -->
      <ul class="navbar-nav">
          <@leftmenus></@leftmenus>
      </ul>
    </div>

  </div>
</nav>
