return {
	s(
		"k8s:metadata",
		fmta(
			[[
				metadata:
				  name: '<name>-{{ .Release.Name }}'
				  labels:
				    app.kubernetes.io/name: '{{ .Chart.Name }}'
				    app.kubernetes.io/component: '<component>'
				    app.kubernetes.io/instance: '{{ .Release.Name }}'
				    app.kubernetes.io/version: '{{ .Chart.AppVersion }}'
			]],
			{
				name = i(1, "name"),
				component = rep(1),
			}
		)
	),
}
