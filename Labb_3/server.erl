-module(server).
-export([start/1,stop/1]).

% Start a new server process with the given name
% Do not change the signature of this function.
start(ServerAtom) ->
    genserver:start(ServerAtom,[], fun handle_ser/2).
    % TODO Implement function
    % - Spawn a new process which waits for a message, handles it, then loops infinitely
    % - Register this process to ServerAtom
    % - Return the process ID
handle_ser(State, {join, Ch, Client}) ->
    case lists:member(Ch, State) of
        true -> res = genserver:request(list_to_atom(Ch),{join,Client}),
        cas res of 
            joined -> 
        end,
        false -> 
    end

% Stop the server process registered to the given name,
% together with any other associated processes
stop(ServerAtom) ->
    genserver:request(ServerAtom, kill_channels),
    genserver:stop(ServerAtom).
