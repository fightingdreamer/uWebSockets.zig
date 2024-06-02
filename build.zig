const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const c_flags = [_][]const u8{
        // examples
        "-std=c++20",
        // // uwebsockets
        // zlib
        "-DUWS_NO_ZLIB",
        // // usockets (dependency)
        // ssl
        "-DLIBUS_NO_SSL",
        // "-DWITH_OPENSSL",
        // "-DWITH_WOLFSSL",
        // "-DWITH_BORINGSSL",
        // event loop
        // "-DWITH_IO_URING",
        // "-DWITH_LIBUV",
        // "-DWITH_ASIO",
        // "-DWITH_GCD",
        // sanitizer
        // "-DWITH_ASAN",
        // quic
        // "-DWITH_QUIC",
    };

    const dep_usockets = b.dependency("usockets", .{});

    const upstream = b.dependency("upstream", .{});
    const include_path = upstream.path("src");
    const examples_path = upstream.path("examples");

    // -------------------------------------------------------------------------

    const headers = b.addNamedWriteFiles("headers");
    _ = headers.addCopyDirectory(upstream.path("src"), "", .{});
    b.installDirectory(.{
        .source_dir = headers.getDirectory(),
        .install_dir = .header,
        .install_subdir = "",
    });

    // -------------------------------------------------------------------------

    const exe_Broadcast = b.addExecutable(.{
        .name = "Broadcast",
        .target = target,
        .optimize = optimize,
    });
    b.installArtifact(exe_Broadcast);

    exe_Broadcast.addIncludePath(include_path);
    exe_Broadcast.addCSourceFiles(.{
        .root = examples_path,
        .files = &.{"Broadcast.cpp"},
        .flags = &c_flags,
    });
    exe_Broadcast.linkLibCpp();
    exe_Broadcast.linkLibrary(dep_usockets.artifact("usockets"));

    // -------------------------------------------------------------------------

    const exe_BroadcastingEchoServer = b.addExecutable(.{
        .name = "BroadcastingEchoServer",
        .target = target,
        .optimize = optimize,
    });
    b.installArtifact(exe_BroadcastingEchoServer);

    exe_BroadcastingEchoServer.addIncludePath(include_path);
    exe_BroadcastingEchoServer.addCSourceFiles(.{
        .root = examples_path,
        .files = &.{"BroadcastingEchoServer.cpp"},
        .flags = &c_flags,
    });
    exe_BroadcastingEchoServer.linkLibCpp();
    exe_BroadcastingEchoServer.linkLibrary(dep_usockets.artifact("usockets"));

    // -------------------------------------------------------------------------

    const exe_Client = b.addExecutable(.{
        .name = "Client",
        .target = target,
        .optimize = optimize,
    });
    b.installArtifact(exe_Client);

    exe_Client.addIncludePath(include_path);
    exe_Client.addCSourceFiles(.{
        .root = examples_path,
        .files = &.{"Client.cpp"},
        .flags = &c_flags,
    });
    exe_Client.linkLibCpp();
    exe_Client.linkLibrary(dep_usockets.artifact("usockets"));

    // -------------------------------------------------------------------------

    const exe_Crc32 = b.addExecutable(.{
        .name = "Crc32",
        .target = target,
        .optimize = optimize,
    });
    b.installArtifact(exe_Crc32);

    exe_Crc32.addIncludePath(include_path);
    exe_Crc32.addCSourceFiles(.{
        .root = examples_path,
        .files = &.{"Crc32.cpp"},
        .flags = &c_flags,
    });
    exe_Crc32.linkLibCpp();
    exe_Crc32.linkLibrary(dep_usockets.artifact("usockets"));

    // -------------------------------------------------------------------------

    const exe_EchoServer = b.addExecutable(.{
        .name = "EchoServer",
        .target = target,
        .optimize = optimize,
    });
    b.installArtifact(exe_EchoServer);

    exe_EchoServer.addIncludePath(include_path);
    exe_EchoServer.addCSourceFiles(.{
        .root = examples_path,
        .files = &.{"EchoServer.cpp"},
        .flags = &c_flags,
    });
    exe_EchoServer.linkLibCpp();
    exe_EchoServer.linkLibrary(dep_usockets.artifact("usockets"));

    // -------------------------------------------------------------------------

    const exe_EchoServerThreaded = b.addExecutable(.{
        .name = "EchoServerThreaded",
        .target = target,
        .optimize = optimize,
    });
    b.installArtifact(exe_EchoServerThreaded);

    exe_EchoServerThreaded.addIncludePath(include_path);
    exe_EchoServerThreaded.addCSourceFiles(.{
        .root = examples_path,
        .files = &.{"EchoServerThreaded.cpp"},
        .flags = &c_flags,
    });
    exe_EchoServerThreaded.linkLibCpp();
    exe_EchoServerThreaded.linkLibrary(dep_usockets.artifact("usockets"));

    // -------------------------------------------------------------------------

    const exe_HelloWorld = b.addExecutable(.{
        .name = "HelloWorld",
        .target = target,
        .optimize = optimize,
    });
    b.installArtifact(exe_HelloWorld);

    exe_HelloWorld.addIncludePath(include_path);
    exe_HelloWorld.addCSourceFiles(.{
        .root = examples_path,
        .files = &.{"HelloWorld.cpp"},
        .flags = &c_flags,
    });
    exe_HelloWorld.linkLibCpp();
    exe_HelloWorld.linkLibrary(dep_usockets.artifact("usockets"));

    // -------------------------------------------------------------------------

    const exe_HelloWorldThreaded = b.addExecutable(.{
        .name = "HelloWorldThreaded",
        .target = target,
        .optimize = optimize,
    });
    b.installArtifact(exe_HelloWorldThreaded);

    exe_HelloWorldThreaded.addIncludePath(include_path);
    exe_HelloWorldThreaded.addCSourceFiles(.{
        .root = examples_path,
        .files = &.{"HelloWorldThreaded.cpp"},
        .flags = &c_flags,
    });
    exe_HelloWorldThreaded.linkLibCpp();
    exe_HelloWorldThreaded.linkLibrary(dep_usockets.artifact("usockets"));

    // -------------------------------------------------------------------------

    const exe_Http3Server = b.addExecutable(.{
        .name = "Http3Server",
        .target = target,
        .optimize = optimize,
    });
    b.installArtifact(exe_Http3Server);

    exe_Http3Server.addIncludePath(include_path);
    exe_Http3Server.addCSourceFiles(.{
        .root = examples_path,
        .files = &.{"Http3Server.cpp"},
        .flags = &c_flags,
    });
    exe_Http3Server.linkLibCpp();
    exe_Http3Server.linkLibrary(dep_usockets.artifact("usockets"));

    // -------------------------------------------------------------------------

    const exe_ParameterRoutes = b.addExecutable(.{
        .name = "ParameterRoutes",
        .target = target,
        .optimize = optimize,
    });
    b.installArtifact(exe_ParameterRoutes);

    exe_ParameterRoutes.addIncludePath(include_path);
    exe_ParameterRoutes.addCSourceFiles(.{
        .root = examples_path,
        .files = &.{"ParameterRoutes.cpp"},
        .flags = &c_flags,
    });
    exe_ParameterRoutes.linkLibCpp();
    exe_ParameterRoutes.linkLibrary(dep_usockets.artifact("usockets"));

    // -------------------------------------------------------------------------

    const exe_ServerName = b.addExecutable(.{
        .name = "ServerName",
        .target = target,
        .optimize = optimize,
    });
    b.installArtifact(exe_ServerName);

    exe_ServerName.addIncludePath(include_path);
    exe_ServerName.addCSourceFiles(.{
        .root = examples_path,
        .files = &.{"ServerName.cpp"},
        .flags = &c_flags,
    });
    exe_ServerName.linkLibCpp();
    exe_ServerName.linkLibrary(dep_usockets.artifact("usockets"));

    // -------------------------------------------------------------------------

    const exe_UpgradeAsync = b.addExecutable(.{
        .name = "UpgradeAsync",
        .target = target,
        .optimize = optimize,
    });
    b.installArtifact(exe_UpgradeAsync);

    exe_UpgradeAsync.addIncludePath(include_path);
    exe_UpgradeAsync.addCSourceFiles(.{
        .root = examples_path,
        .files = &.{"UpgradeAsync.cpp"},
        .flags = &c_flags,
    });
    exe_UpgradeAsync.linkLibCpp();
    exe_UpgradeAsync.linkLibrary(dep_usockets.artifact("usockets"));

    // -------------------------------------------------------------------------

    const exe_UpgradeSync = b.addExecutable(.{
        .name = "UpgradeSync",
        .target = target,
        .optimize = optimize,
    });
    b.installArtifact(exe_UpgradeSync);

    exe_UpgradeSync.addIncludePath(include_path);
    exe_UpgradeSync.addCSourceFiles(.{
        .root = examples_path,
        .files = &.{"UpgradeSync.cpp"},
        .flags = &c_flags,
    });
    exe_UpgradeSync.linkLibCpp();
    exe_UpgradeSync.linkLibrary(dep_usockets.artifact("usockets"));
}
