param location string
param imageName string
param imageTag string
param prefix string
param dnsNameLabel string
param appPort int
param containerCpu int
param containerMemory int
param registryServer string = ''
param registryUsername string = ''
@secure()
param registryPassword string = ''

resource law 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {
  name: '${prefix}-law'
  location: location
  properties: {
    sku: {
      name: 'PerGB2018'
    }
    retentionInDays: 30
  }
}

var workspaceKey = listKeys(law.id, '2020-08-01').primarySharedKey

resource cg 'Microsoft.ContainerInstance/containerGroups@2023-05-01' = {
  name: '${prefix}-cg'
  location: location
  properties: {
    osType: 'Linux'
    restartPolicy: 'Always'
    ipAddress: {
      type: 'Public'
      dnsNameLabel: dnsNameLabel
      ports: [
        {
          protocol: 'TCP'
          port: appPort
        }
      ]
    }
    imageRegistryCredentials: empty(registryServer) ? [] : [
      {
        server: registryServer
        username: registryUsername
        password: registryPassword
      }
    ]
    diagnostics: {
      logAnalytics: {
        workspaceId: law.properties.customerId
        workspaceKey: workspaceKey
      }
    }
    containers: [
      {
        name: imageName
        properties: {
          image: '${registryServer}/${imageName}:${imageTag}'
          ports: [
            {
              port: appPort
            }
          ]
          resources: {
            requests: {
              cpu: containerCpu
              memoryInGB: containerMemory
            }
          }
        }
      }
    ]
  }
}

output appUrl string = 'https://${dnsNameLabel}.${location}.azurecontainer.io'
