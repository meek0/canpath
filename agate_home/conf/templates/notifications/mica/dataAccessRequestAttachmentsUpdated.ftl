<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">
<head lang="en">
  <meta charset="UTF-8"/>
  <title></title>
</head>
<body
        style="margin: 0;font-family: 'Lato','Helvetica Neue',Helvetica,Arial,sans-serif;font-size: 15px;line-height: 1.5;color: #2c3e50;background-color: #ffffff;">

<div class="well"
     style="min-height: 20px;padding: 19px;margin-bottom: 20px;background-color: #ecf0f1;border: 1px solid transparent;border-radius: 4px;-webkit-box-shadow: none;box-shadow: none;">
  <div style="margin: auto;max-width: 700px;">
    <div
            style="margin-bottom: 21px;background-color: #ffffff;border-radius: 4px;-webkit-box-shadow: 0 1px 1px rgba(0,0,0,0.05);box-shadow: 0 1px 1px rgba(0,0,0,0.05);border: 1px solid #18bc9c;">
      <div
              style="padding: 10px 15px;border-top-right-radius: 3px;border-top-left-radius: 3px;color: #ffffff;background-color: #18bc9c;border-color: #18bc9c;">
        <h3
                style="font-family: 'Lato','Helvetica Neue',Helvetica,Arial,sans-serif;font-weight: 400;line-height: 1.1;color: inherit;margin-top: 0;margin-bottom: 0;font-size: 17px;">
          <span>CanPath</span> - Data access<span style="float: right !important;font-size: 13px;vertical-align: text-bottom;">French version below</span></h3>
      </div>
      <div class="panel-body" style="padding: 15px;">
        <p style="margin: 0 0 10px;">
          Dear <span>${user.firstName}</span> <span>${user.lastName}</span>,
        </p>
        <p style="margin: 0 0 10px;">
          The list of additional documents has been updated in the access request"<strong>${title}</strong>(<strong>${id}</strong>)". Please click <a href="${publicUrl}/data-access/${id}" target="_blank">here</a> to view all documents.
        </p>
        <div style="margin: 30px 0 0;">
          <hr width="55%" size="1" align="left" style="padding: 0; margin-top: 0;"/>
          <p style="font-family:monospace;font-size: 10px">
            Canadian Partnership for Tomorrow's Health, Access Office<br/>
            Centre of Genomics and Policy - McGill University<br/>
            740 Dr. Penfield Avenue, Room 5103<br/>
            Montréal (Québec) Canada<br/>
            H3A 0G1<br/>
            <br/>
            <a href="mailto:access@canpath.ca" target="_blank">access@canpath.ca</a><br/>
            <br/>
            <a href="https://canpath.ca" target="_blank">https://canpath.ca</a><br/>
            <a href="https://portal.canpath.ca/" target="_blank">https://portal.canpath.ca</a>
          </p>
        </div>
      </div>
    </div>
    <p class="help-block" style="display: block;margin: 5px 0 10px;color: #597ea2;">
      ** Do Not Reply - This is an auto-generated email. **
    </p>
  </div>
</div>
<div class="well"
     style="min-height: 20px;padding: 19px;margin-bottom: 20px;background-color: #ecf0f1;border: 1px solid transparent;border-radius: 4px;-webkit-box-shadow: none;box-shadow: none;">
  <div style="margin: auto;max-width: 700px;">
    <div
            style="margin-bottom: 21px;background-color: #ffffff;border-radius: 4px;-webkit-box-shadow: 0 1px 1px rgba(0,0,0,0.05);box-shadow: 0 1px 1px rgba(0,0,0,0.05);border: 1px solid #18bc9c;">
      <div
              style="padding: 10px 15px;border-top-right-radius: 3px;border-top-left-radius: 3px;color: #ffffff;background-color: #18bc9c;border-color: #18bc9c;">
        <h3
                style="font-family: 'Lato','Helvetica Neue',Helvetica,Arial,sans-serif;font-weight: 400;line-height: 1.1;color: inherit;margin-top: 0;margin-bottom: 0;font-size: 17px;">
          <span>CanPath</span> - Demande d'accès<span style="float: right !important;font-size: 13px;vertical-align: text-bottom;">Version anglaise ci-dessus</span></h3>
      </div>
      <div class="panel-body" style="padding: 15px;">
        <p style="margin: 0 0 10px;">
          Bonjour <span>${user.firstName}</span> <span>${user.lastName}</span>,
        </p>
        <p style="margin: 0 0 10px;">
          La liste de documents additionnels a été mise à jour dans la demande d'accès "<strong>${title}</strong> (<strong>${id}</strong>)". Veuillez cliquer <a href="${publicUrl}/data-access/${id}" target="_blank">ici</a> pour consulter la liste des documents.
        </p>
        <div style="margin: 30px 0 0;">
          <hr width="72%" size="1" align="left" style="padding: 0; margin-top: 0;"/>
          <p style="font-family:monospace;font-size: 10px">
            Bureau d'accès du Partenariat canadien pour la santé de demain<br/>
            Centre de génomique et politiques – Université McGill<br/>
            740, avenue Dr Penfield, Bureau 5103<br/>
            Montréal (Québec) Canada<br/>
            H3A 0G1<br/>
            <br/>
            <a href="mailto:access@canpath.ca" target="_blank">access@canpath.ca</a><br/>
            <br/>
            <a href="https://canpath.ca" target="_blank">https://canpath.ca</a><br/>
            <a href="https://portal.canpath.ca/" target="_blank">https://portal.canpath.ca</a>
          </p>
        </div>

      </div>
    </div>
    <p class="help-block" style="display: block;margin: 5px 0 10px;color: #597ea2;">
      ** Ne pas répondre - ceci est un courriel généré automatiquement. **
    </p>
  </div>
</div>


</body>
</html>
