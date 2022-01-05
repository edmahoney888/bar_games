'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "c503787d3e881ad17ab48689d122c8fd",
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
"assets/assets/images/playeravatars/girl01.PNG": "dd922f6e4888bd53324a24d49494923c",
"assets/assets/images/playeravatars/girl02.PNG": "f60f69693df1645c57c6318f49490a88",
"assets/assets/images/playeravatars/girl03.PNG": "1c82328e4d8274b1488ab7775f51b05d",
"assets/assets/images/playeravatars/girl04.jpg": "fb30caf9ed80d46d57fd29c95e89b185",
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
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/NOTICES": "ea9e34decc261c0d6288e027197e0cd2",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "dd54a8d1eeddfcde18db54e240ef72fd",
"/": "dd54a8d1eeddfcde18db54e240ef72fd",
"main.dart.js": "dc2e9755129452172fd4dacf1de28a14",
"manifest.json": "680cfe490c08ec2af19077bc0fa7e302",
"version.json": "deec70a690896532fbac3a0c4c065db7"
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
