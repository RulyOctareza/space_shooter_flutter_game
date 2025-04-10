'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "c8f07b830cc79e0c457ab6568f596e42",
"version.json": "dbc61e424b60b646cb307497b57735bf",
"index.html": "dc9b4521eb8d8a102e6cc2bdf2b3668d",
"/": "dc9b4521eb8d8a102e6cc2bdf2b3668d",
"main.dart.js": "287a265ebe4bcec55e57a8c4c82b52bb",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "d05d9f606d9cb881dea058f18bbdc927",
"assets/AssetManifest.json": "e480ee7c124746c20e8e8a86943ed140",
"assets/NOTICES": "0b93a2d88d7c672cb564aa61eb4aa711",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "8980a25c0ba4581e9e34a7f42d4c6e27",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "3c9027bc9df8079c3ec446846c4c62d4",
"assets/fonts/MaterialIcons-Regular.otf": "c0ad29d56cfe3890223c02da3c6e0448",
"assets/assets/images/ships/spaceShips_009.png": "f5c1fda9c8e31ffffa44d914087f560a",
"assets/assets/images/ships/spaceShips_001.png": "3bf7265ab9582a83d6b06dc3df6f100d",
"assets/assets/images/bullets/spaceMissiles_015.png": "d0dc62332656685003e680632c884cc8",
"assets/assets/images/bullets/spaceMissiles_018.png": "b5cea61a9dba29e34471040d02091e9e",
"assets/assets/images/meteor/spaceMeteors_003.png": "010a012695a6f34bd5af769c0a6c99a1",
"assets/assets/images/meteor/spaceMeteors_002.png": "96aca7994c4a1c05e281239c1cfe32a1",
"assets/assets/images/meteor/spaceMeteors_001.png": "1ff815b28a8f5dde09ca231559839d51",
"assets/assets/images/meteor/spaceMeteors_004.png": "7154cc2355b6df5cf649bad8eec47c16",
"assets/assets/images/parallax/bkgd_0.png": "5ea43699ad265f25b3029fd0885ce225",
"assets/assets/images/parallax/bkgd_1.png": "3690367cfd2f07925e97e98dbac0c2cb",
"assets/assets/images/parallax/bkgd_3.png": "087e082fdbea7a07189687dd3dd0c4a6",
"assets/assets/images/parallax/bkgd_2.png": "d41441c27db5d78b1e8682e2fcd3d054",
"assets/assets/images/parallax/bkgd_6.png": "bd201422b9f83f103ce3084d44ac9b27",
"assets/assets/images/parallax/bkgd_5.png": "adfb98146b38e80c7bd764afbbf3298f",
"assets/assets/images/parallax/bkgd_4.png": "3574b605b83ace5582fff67a445e2898",
"assets/assets/images/parallax/spr_stars02.png": "abd1fc2cf1c590241e3e2b9d0cdb7556",
"assets/assets/images/parallax/spr_stars01.png": "ddd055057df8ffda388bd06142a9759e",
"assets/assets/images/explosion/explosion1.png": "89d3ec5d68329c59a53fcaa91db9f6f6",
"assets/assets/images/explosion/explosion2.png": "f60687bcdf419ad4e4d887458b2ccea2",
"assets/assets/images/explosion/explosion3.png": "e0923c9bb1da36e3657b5261ff20a838",
"assets/assets/images/items/gold_2.png": "5459782269248701e0763e87e5cb58f2",
"assets/assets/images/items/gold_3.png": "aa6be19fab8a02704eaccf810fabe347",
"assets/assets/images/items/gold_1.png": "a9a63f7d2e4660e8f0671e3182974241",
"assets/assets/images/items/gold_4.png": "c303e4dd51006c2cb40038d5a7c7436e",
"assets/assets/audio/Looping%2520Ascent%2520-%2520Joel%2520Cummins.mp3": "558e7aac3fafa543aae6e17946f0582c",
"assets/assets/audio/EXPLDsgn_Explosion%2520Impact_14.wav": "454180bdc8547b81115f10cd9a06a5af",
"assets/assets/audio/EXPLDsgn_Implode_15.wav": "4ab9568ef3ee3b7e130d79f2a2203f53",
"assets/assets/audio/GUNArtl_Grenade%2520Launcher%2520Fire_05.wav": "39060806cf87ea77193fa7f888e7a32d",
"assets/assets/audio/audio%2520copyright": "c35bbc337e4d198371e5f3f376575e0f",
"assets/assets/audio/Mysterious%2520Strange%2520Things%2520-%2520Yung%2520Logos.mp3": "62e57064445710142522744252fcae29",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206"};
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
