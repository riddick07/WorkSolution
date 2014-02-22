<div class="span2">
    <ul class="nav nav-list">
        <li class="nav-header">Navigation</li>
        <li id="stagingList"><a
            href="StagingList.vw?stagingId=${param['stagingId']}&activeItem='stagingList'">Staging
                List</a></li>
        <li id="stagingOverview"><a
            href="StagingOverview.vw?stagingId=${param['stagingId']}&activeItem='stagingOverview'">Staging
                Overview</a></li>
        <li id="stagingOutput"><a
            href="StagingOutput.vw?stagingId=${param['stagingId']}&activeItem='stagingOutput'">Staging
                Output</a></li>
        <li id="versionOne"><a
            href="VersionOne.vw?stagingId=${param['stagingId']}&activeItem='versionOne'">Version
                One</a></li>
        <li id="parameterChanges"><a
            href="ParameterChanges.vw?stagingId=${param['stagingId']}&activeItem='parameterChanges'">Parameter
                Changes</a></li>
        <li id="gluConfigurations"><a
            href="GluConfigurations.vw?stagingId=${param['stagingId']}&activeItem='gluConfigurations'">Glu
                Configurations</a></li>
        <li id="approval"><a
            href="Approval.vw?stagingId=${param['stagingId']}&activeItem='approval'">VRR</a></li>
        <li id="releaseNotes"><a
            href="ReleaseNotes.vw?stagingId=${param['stagingId']}&activeItem='releaseNotes'">Release
                Notes</a></li>
    </ul>
</div>

<script type="text/javascript">
	$().ready(
			function() {
				$("div.span2>ul.nav-list>li#${param['activeItem']}").addClass("active");
			});
</script>

