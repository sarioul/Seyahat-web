'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "b2ef930bb49849a4d924f52e11c6fc59",
"assets/AssetManifest.bin.json": "ef8148361f5da1969f562c9be90ff978",
"assets/AssetManifest.json": "454cb02c88cfdc2bb8c8a605839b027c",
"assets/assets/fonts/MyFlutterApp.ttf": "36e2367d3b7a82055da5f39780b4c1fc",
"assets/FontManifest.json": "1e2b2284e66a9e54db0bfe7ac4f8d5d6",
"assets/fonts/MaterialIcons-Regular.otf": "9785cda19cc5b3ee6343d0bbb74a6779",
"assets/images/araba_1.png": "5e4af17d3a2f54fd21b9b502f21df41d",
"assets/images/araba_2.png": "73ff2d33fb2a2b1bfde2ebcb1424a995",
"assets/images/bmw/1.png": "8bfb52adafe93c8d7e9d6bc732177caa",
"assets/images/bmw/2.png": "5e4af17d3a2f54fd21b9b502f21df41d",
"assets/images/bmw/3.png": "74d99afaa4544d144461c8f6c41c7549",
"assets/images/bmw/4.png": "cc4e5111f5daf478196d82b8c9c2eb0b",
"assets/images/bungalov/1/1.png": "9fb48046ffcbae245c74fee14004b06e",
"assets/images/bungalov/1/2.png": "cdc64e2245bb2dfc3630b1544463f393",
"assets/images/bungalov/1/3.png": "9bec8f2bf7e7e2216f23d912f4604d58",
"assets/images/bungalov/1/4.png": "9bca583e4bc6be7fc0080b7aa8a28991",
"assets/images/bungalov/2/1.png": "f6303cae8aff26dfbbbcecf2824ff504",
"assets/images/bungalov/2/2.png": "8cbe4ca94995570e42296ae4a8b72248",
"assets/images/bungalov/2/3.png": "eee5a267d617335c9bf563f2611712d0",
"assets/images/bungalov/2/4.png": "cf2cfc8529e484a91251c84658d1d98e",
"assets/images/bungalov/3/1.png": "87353d1ee297aa4fdb64348b03f8883d",
"assets/images/bungalov/3/2.png": "0bbd8973c58817ef2a6d97b15f730c11",
"assets/images/bungalov/3/3.png": "4b315f0c4f709cb948b02a79df96c6aa",
"assets/images/bungalov/3/4.png": "a2f67885e3d8c937ab50651a36b53a59",
"assets/images/bungalov.jpg": "1ce27b046f0d33fc30308256dd563de7",
"assets/images/daglar.jpg": "b5a39f7707335e3305e12a4125c1e88e",
"assets/images/goller.jpg": "6e24ebc442b7f5947308f2d04992b79f",
"assets/images/hotel.jpg": "c6a89a58f5c0be5e99bc2887cf8b38d1",
"assets/images/hoteller/marina_green_hotel/1.png": "f153b305f6fd095d802132a632ea0d45",
"assets/images/hoteller/marina_green_hotel/2.png": "6803ce9bf4f6c884710bde590dced2bf",
"assets/images/hoteller/marina_green_hotel/3.png": "876647ace672cceacaf6feb810fdb7a1",
"assets/images/hoteller/marina_green_hotel/4.png": "984cf03a3caf1d7f507ec947e958fb4e",
"assets/images/hoteller/marina_green_hotel/5.png": "19812ac5442372803698a314428bcfd8",
"assets/images/hoteller/marina_green_hotel/6.png": "4bde428d07e3c7fc6b6ba5ca85b38fff",
"assets/images/hoteller/satana_hotel/1.png": "60be9fdddb2d733d3c8eb536112a08ee",
"assets/images/hoteller/satana_hotel/2.png": "d8e6a469edfc2f61655d5352093355c4",
"assets/images/hoteller/satana_hotel/3.png": "83c791ee5e6213a7e6db4b3375cf18ac",
"assets/images/hoteller/satana_hotel/4.png": "26819ae4c4e68c020d70971d37ea0838",
"assets/images/hoteller/satana_hotel/5.png": "8ed04e654de603a024d8dad578a4bac2",
"assets/images/hoteller/satana_hotel/6.png": "157401de374082ca289dfa300e5c099c",
"assets/images/hoteller/white_house_hotel/1.png": "c6a89a58f5c0be5e99bc2887cf8b38d1",
"assets/images/hoteller/white_house_hotel/2.png": "7cf9091b3b394b81fdffd473b16615d0",
"assets/images/hoteller/white_house_hotel/3.png": "0d6e6e4738f8ae4c055a60f6675604c8",
"assets/images/hoteller/white_house_hotel/4.png": "5ec68371186ed14cdda6372dee706134",
"assets/images/hoteller/white_house_hotel/5.png": "848e1d8ede130473028f358ef9a8051a",
"assets/images/hoteller/white_house_hotel/6.png": "c3c9185cf336b94dbf93bc99e5605c71",
"assets/images/mercedes/1.png": "8eccadd80ee5e63fc2f5c5bed9779bbe",
"assets/images/mercedes/2.png": "ce43d6d66388fe716530b3c4155a50d0",
"assets/images/mercedes/3.png": "73ff2d33fb2a2b1bfde2ebcb1424a995",
"assets/images/mercedes/4.png": "cc1e62ca1270a1c4dba181ed1005fa83",
"assets/images/orman.jpg": "56964151a8e028104b5be2f9a5aabee7",
"assets/images/polat.png": "275bbd1b05c1d8170840d54691126f50",
"assets/images/tarihi_yerler.jpg": "d9805164ab3ccac73882586a12843d0f",
"assets/images/tesla/1.png": "03e46aefd717c4aa4ec0e7bff8c8050a",
"assets/images/tesla/2.png": "9989db0af52a232ae2c9309162d7fc58",
"assets/images/tesla/3.png": "a58d4f7e00eb70e19a7092f21f33e0bd",
"assets/images/tesla/4.png": "39d94013aacc01c2a4caf89623b83615",
"assets/images/uzungol-1.jpg": "84847cc7dbe2360665618a3665794f3c",
"assets/images/uzungol-2.jpg": "7773b8efd6b7682d952b87eb1a629cd9",
"assets/images/uzungol-3.jpg": "74dd2a81d074aa75128ea1a7a22e6a46",
"assets/images/yaylalar.jpg": "5179a298d3b81dd91389d5bdeb0539e4",
"assets/NOTICES": "fc0caef691b35e711a0acdc345eeef7d",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "c5f0054b89165edc3724e4851dc56004",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "15c6738728b7e1ed2c4e8ddbd258ff2c",
"/": "15c6738728b7e1ed2c4e8ddbd258ff2c",
"main.dart.js": "c9e607ed0db8850870c6fda76fe87797",
"manifest.json": "56c135b2bcd95a7b4e5ebc7628efd8f0",
"version.json": "b52f42c241f9aa3a2ed4d5089d8ad651"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
