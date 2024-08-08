{ ... }: {
    services.snapper = {
        snapshotInterval = "daily";
        cleanupInterval = "7D";
        configs."home" = {
            SUBVOLUME = "/partition-root/home";
            TIMELINE_CREATE = true;
            TIMELINE_CLEANUP = true;
        };
        configs."rootfs" = {
            SUBVOLUME = "/partition-root/rootfs";
            TIMELINE_CREATE = true;
            TIMELINE_CLEANUP = true;
        };
    };
}
