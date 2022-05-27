'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "55ce0205a94eff0bd14d7fcc635ee65f",
"assets/assets/images/buagame/blank.png": "62fe0ec02ddde3d4f8e50b4cf31adfae",
"assets/assets/images/buagame/crab.png": "4692eb9941489dea256368f71c6b35c7",
"assets/assets/images/buagame/fish.png": "e0b0d490978288ce2d6ed5f266f3ae06",
"assets/assets/images/buagame/gourd.png": "74b9bb98445389a194c0efa386c50483",
"assets/assets/images/buagame/prawn.png": "1ccd411f33e988f583fd7f7732cde9bf",
"assets/assets/images/buagame/rooster.png": "320f8ee237b68e0533d68e53467a316d",
"assets/assets/images/buagame/tiger.png": "e4ebd8f6d4f7ba069147db3edd5038f0",
"assets/assets/images/common/blankdice.png": "03903cf41aacf951c1c0037bdb2dd4bf",
"assets/assets/images/common/dice1.png": "246f2dda5a137ee9a022026329258ae3",
"assets/assets/images/common/dice2.png": "4b196cdd5ced0c30aa783ec80535acc8",
"assets/assets/images/common/dice3.png": "b820d6db4267c5baeb4da1475919b549",
"assets/assets/images/common/dice4.png": "8de59eece1200c1d0e80cb93b701f2cb",
"assets/assets/images/common/dice5.png": "aa9bdd305f66ed0bd259aadb4e17328a",
"assets/assets/images/common/dice6.png": "c27231a06070be8297b000bf1111034e",
"assets/assets/images/playeravatars/blankPlayer.jpg": "9935bc8d163c8c29de31d4398508b867",
"assets/assets/images/playeravatars/female01.png": "9b49b7405732d71ae98ed13aae274436",
"assets/assets/images/playeravatars/female02.png": "67070fcef5421e959d75de6c9b43c019",
"assets/assets/images/playeravatars/female03.png": "60fbb732ffab2f7520f47561851a6785",
"assets/assets/images/playeravatars/female04.png": "ec0a4d18ba592c662305d8c659b82805",
"assets/assets/images/playeravatars/female05.png": "2376adf23994d58c24a5e54256e00d24",
"assets/assets/images/playeravatars/female06.png": "ab929eb524119f0164c13f8b568cedfb",
"assets/assets/images/playeravatars/female07.png": "8e90e0274e0416e4d275c616720e2671",
"assets/assets/images/playeravatars/female08.png": "b4ab2bb54aa3b7b6305addfc85c3695c",
"assets/assets/images/playeravatars/female09.png": "7c42ef26d17a98fa4e3338fbb56a1d3a",
"assets/assets/images/playeravatars/female10.png": "c07279851678ce95307cec198864aef1",
"assets/assets/images/playeravatars/female11.png": "a5c3d9ad9b6bd08afbb485d887882ec2",
"assets/assets/images/playeravatars/female12.png": "3cd4d9f6fe4527185c0dcd561be61829",
"assets/assets/images/playeravatars/male01.png": "5adbec9c7352c63faacabd169243bad2",
"assets/assets/images/playeravatars/male02.png": "f30389ae4d04aa7908311d680bb8ffba",
"assets/assets/images/playeravatars/male03.png": "058142896126a2816928361468d9cc9a",
"assets/assets/images/playeravatars/male04.png": "99a9fe28e5267849aeab8cd9012ab7d9",
"assets/assets/images/playeravatars/male05.png": "eb295c4c985e8260a89fece0b42a71ac",
"assets/assets/images/playeravatars/male06.png": "c9cea6423952747b07ce16c50e70e861",
"assets/assets/images/playeravatars/male07.png": "e387459d4ce392ef0041ee7b2ae342d4",
"assets/assets/images/playeravatars/male08.png": "14d783d7719b70e74d6b665ac58f3c31",
"assets/assets/images/playeravatars/male09.png": "81b449e51aac7b96d76ae1d7fe31d33b",
"assets/assets/images/playeravatars/male10.png": "1663df73179faab81fa13f008fbd1cf5",
"assets/assets/images/playeravatars/male11.png": "a4bf7209ef4fb916e9d9df66e35155fb",
"assets/assets/images/playeravatars/male12.png": "7b3291f17990d87a72619bcc602f0a9b",
"assets/assets/images/racegame/blankRacer.png": "a88f66663d61922a203af1bc145cead4",
"assets/assets/images/racegame/bull.gif": "f3728cc94347d5a59e1a81bf8d5c4a52",
"assets/assets/images/racegame/bunny.gif": "a4ee2e5cba30517afade5f118150fb13",
"assets/assets/images/racegame/elephant.gif": "66bd4d0c550b97efb9857ce629009444",
"assets/assets/images/racegame/frog.gif": "2e89149ec169731e1b3262c0987a37ba",
"assets/assets/images/racegame/horse.gif": "6f4d095094f541ac5604a707b92d5eeb",
"assets/assets/images/racegame/monkey.gif": "48309353d2142dac601c37839c4470d4",
"assets/assets/images/racegame/ostrich.gif": "86951bfba22169c881787f6696fd59bf",
"assets/assets/images/racegame/sheep.gif": "a06ab8bd0a9a6efee25849b4225f6f29",
"assets/assets/images/racegame/tiger.gif": "c4b94ad024f8edeca24a2cb31da5a81c",
"assets/assets/images/racegame/turtle.gif": "bfdfc87663635e493481be303c89d6ce",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "7e7a6cccddf6d7b20012a548461d5d81",
"assets/NOTICES": "1f9161b281264ed3a585d82dc4b80f28",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "cd8390de963d3d12772b62c551192442",
"/": "cd8390de963d3d12772b62c551192442",
"main.dart.js": "b1780407fdaf7a0421b7fb7336df9d56",
"manifest.json": "680cfe490c08ec2af19077bc0fa7e302",
"version.json": "5eb70eed25a813b1e98119a7b0b2132c"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
