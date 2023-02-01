<?
return array (
'pull' => Array(
      'value' =>  array(
          'path_to_listener' => 'http://nginx/bitrix/sub/',
          'path_to_listener_secure' => 'https://nginx/bitrix/sub/',
          'path_to_modern_listener' => 'http://nginx/bitrix/sub/',
          'path_to_modern_listener_secure' => 'https://nginx/bitrix/sub/',
          'path_to_mobile_listener' => 'http://nginx:8893/bitrix/sub/',
          'path_to_mobile_listener_secure' => 'https://nginx:8894/bitrix/sub/',
          'path_to_websocket' => 'ws://nginx/bitrix/subws/',
          'path_to_websocket_secure' => 'wss://nginx/bitrix/subws/',
          'path_to_publish' => 'http://nginx:8895/bitrix/pub/',
          'nginx_version' => '4',
          'nginx_command_per_hit' => '100',
          'nginx' => 'Y',
          'nginx_headers' => 'N',
          'push' => 'Y',
          'websocket' => 'Y',
          'signature_key' => 'bVQdNsrRsulOnj9lkI0sPim292jMtrnji0zzEl5MzCBeHT7w1E5HL3aihFb6aiFJfNEIDxmcFrowS3PTLZFDxAfuNNuCN5EcFRaveaUaRZHSThtWKV7Vp5vGbz9kb3cN',
          'signature_algo' => 'sha1',
          'guest' => 'N',
      ),
  ),
);