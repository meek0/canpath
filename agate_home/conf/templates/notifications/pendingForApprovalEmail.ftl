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
          <span>${organization}</span> - Account registration</h3>
      </div>
      <div class="panel-body" style="padding: 15px;">
        <p style="margin: 0 0 10px;">
          Dear <span>${user.firstName}</span> <span>${user.lastName}</span>,
        </p>
        <p style="margin: 0 0 10px;">
          Thank you for registering at <span>${organization}</span>. Your application for an
          account is currently pending approval. Once it has been approved, you will receive another e-mail containing
          information about how to sign-in, set your password, and other details.
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

</body>
</html>

