description: "Admin link signed by a writer"

users: {
  "herb": {}
  "basil": {}
  "rose": {}
}

teams: {
  "cabal": {
    links: [
      type: "root"
      signer: "herb"
      members:
        owner: ["herb"]
        writer: ["basil"]
    ,
      # invalid link
      # basil tries to be an admin
      type: "change_membership"
      signer: "basil"
      members:
        writer: ["rose"]
    ]
  }
}

sessions: [
  loads: [
    error: true,
    error_type: "AdminPermissionError"
  ]
,
  loads: [
    upto: 1
  ,
    error: true,
    error_type: "AdminPermissionError"
  ]
]
